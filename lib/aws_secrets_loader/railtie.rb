# frozen_string_literal: true

module AwsSecretsLoader
  class Railtie < Rails::Railtie
    config.before_configuration do
      AwsSecretsLoader::AwsFetcher.load
    end
  end
end
