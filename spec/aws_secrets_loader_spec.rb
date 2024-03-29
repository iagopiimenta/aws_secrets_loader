# frozen_string_literal: true

RSpec.describe AwsSecretsLoader::AwsFetcher do
  before do
    stub_const(
      'ENV',
      'AWS_REGION' => 'us-east-1',
      'KEEP_ORIGINAL' => 'TEST*123',
      'ORIGINAL_VAR' => 'change_me',
      'AWS_ACCESS_KEY_ID' => 'AKID_ENV_STUB',
      'AWS_SECRET_ACCESS_KEY' => 'SECRET_ENV_STUB',
      'AWS_SECRET_NAME' => 'prod/m4u/tim_recarga/burnout'
    )
  end

  let(:aws_response_hash) do
    {
      VARIABLE_FROM_AWS_SECRETS: 'AIR*123',
      ORIGINAL_VAR: 'THUNDER'
    }
  end

  let(:aws_response_struct) { Struct.new(:secret_string) }
  let(:aws_response_json) { aws_response_struct.new(aws_response_hash.to_json) }

  before do
    allow(Aws::SecretsManager::Client)
      .to receive(:new)
      .and_return(Aws::SecretsManager::Client.new(stub_responses: true))

    allow_any_instance_of(Aws::SecretsManager::Client)
      .to receive(:get_secret_value)
      .with(secret_id: ENV.fetch('AWS_SECRET_NAME', nil))
      .and_return(aws_response_json)
  end

  subject { described_class.load }

  it 'has a version number' do
    expect(AwsSecretsLoader::VERSION).not_to be nil
  end

  context 'populate in acceptable environments' do
    it 'populate environment variables' do
      subject
      expect(ENV.fetch('ORIGINAL_VAR', nil)).to eq('THUNDER')
      expect(ENV.fetch('KEEP_ORIGINAL', nil)).to eq('TEST*123')
      expect(ENV.fetch('VARIABLE_FROM_AWS_SECRETS', nil)).to eq('AIR*123')
    end
  end
end
