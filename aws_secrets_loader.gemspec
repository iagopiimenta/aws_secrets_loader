require_relative 'lib/aws_secrets_loader/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_secrets_loader"
  spec.version       = AwsSecretsLoader::VERSION
  spec.authors       = ["Iago"]
  spec.email         = ["iagopimenta.s@gmail.com"]

  spec.summary       = %q{AWS Secret Manager Loader on Rails}
  spec.description   = %q{AWS Secret Manager Loader on Rails}
  spec.homepage      = "https://github.com/iagopiimenta/aws_secrets_loader"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'aws-sdk-secretsmanager'
end
