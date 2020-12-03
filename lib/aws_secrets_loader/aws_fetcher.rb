# frozen_string_literal: true

require 'aws-sdk-secretsmanager'
require 'json'

module AwsSecretsLoader
  class AwsFetcher
    class << self
      def load
        secrets = fetch_secrets
        add_to_environment(secrets)
      end

      private

      def fetch_secrets
        client = Aws::SecretsManager::Client.new
        get_secret_value_response = client.get_secret_value(secret_id: secret_name)

        JSON.parse(get_secret_value_response.secret_string)
      end

      def add_to_environment(secrets)
        secrets.each do |key, value|
          ENV[key] = value
        end
      end

      def secret_name
        ENV['AWS_SECRET_NAME']
      end
    end
  end
end
