require 'telegram/bot'
require 'yaml'

$:.unshift("#{Dir.pwd}/lib")

require 'kingsburg_bot/configurator'
require 'kingsburg_bot/client'
require 'kingsburg_bot/messenger'
require 'kingsburg_bot/message_parser'
require 'kingsburg_bot/commands_keeper'
require 'kingsburg_bot/commands_manager'
require 'kingsburg_bot/responder'

module KingsburgBot
  def self.start_client
    Client.new(Configurator.bot_token).start
  end
end
