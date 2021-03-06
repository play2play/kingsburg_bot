module KingsburgBot
  module Configurator
    CONFIG_PATH = 'config/config.yml'.freeze

    module_function

    def bot_token
      loaded['bot_token']
    end

    def loaded
      YAML.load(erb_result)
    end

    def yaml_file
      File.read(CONFIG_PATH)
    end

    def erb_result
      ERB.new(yaml_file).result
    end
  end
end
