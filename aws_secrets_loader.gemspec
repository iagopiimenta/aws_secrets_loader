# frozen_string_literal: true

require_relative 'lib/aws_secrets_loader/version'

Gem::Specification.new do |spec|
  spec.name          = 'aws_secrets_loader'
  spec.version       = AwsSecretsLoader::VERSION
  spec.authors       = ['Iago']
  spec.email         = ['iagopimenta.s@gmail.com']

  spec.summary       = 'AWS Secret Manager Loader on Rails'
  spec.description   = 'AWS Secret Manager Loader on Rails'
  spec.homepage      = 'https://github.com/iagopiimenta/aws_secrets_loader'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'aws-sdk-secretsmanager', '~> 1.43'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.1'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
