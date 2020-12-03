require "aws_secrets_loader/version"
require "aws_secrets_loader/aws_fetcher"
require "aws_secrets_loader/railtie" if defined?(Rails::Railtie)

module AwsSecretsLoader
  class Error < StandardError; end
  # Your code goes here...
end
