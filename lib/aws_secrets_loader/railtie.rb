# frozen_string_literal: true

module AwsSecretsLoader
  class Railtie < Rails::Railtie
    config.before_configuration do
      AwsSecretsLoader::AwsFetcher.load if (ENV['AWS_SECRETS_LOADER'] || ENV['AWS_SECRET_NAME'])
    end
  end
end
