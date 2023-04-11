# frozen_string_literal: true

require 'aws-sdk-secretsmanager'
require 'json'

module AwsSecretsLoader
  class AwsFetcher
    class << self
      def load
        secret_names.each do |secret_name|
          secrets = fetch_secrets(secret_name)

          add_to_environment(secrets)
        end
      end

      private

      def fetch_secrets(secret_name)
        client = Aws::SecretsManager::Client.new
        secret_value = client.get_secret_value(secret_id: secret_name)

        valid_json?(secret_value.secret_string) || { secret_name.to_s => secret_value.secret_string }
      end

      def add_to_environment(secrets)
        secrets.each do |key, value|
          ENV[key] = value
        end
      end

      def secret_names
        ENV['AWS_SECRET_NAME'] ? ENV['AWS_SECRET_NAME'].split(',') : []
      end

      def valid_json?(string)
        JSON.parse(string)
      rescue JSON::ParserError
        nil
      end
    end
  end
end
