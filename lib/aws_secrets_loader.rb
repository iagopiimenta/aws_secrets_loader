# frozen_string_literal: true

require 'aws_secrets_loader/version'
require 'aws_secrets_loader/aws_fetcher'
require 'aws_secrets_loader/railtie' if defined?(Rails::Railtie)

module AwsSecretsLoader
  SECRET_NAMES = ENV['AWS_SECRETS_LOADER'] || ENV['AWS_SECRET_NAME']
end
