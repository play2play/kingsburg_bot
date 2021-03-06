module KingsburgBot
  class Responder
    attr_reader :api, :message

    def initialize(api, message)
      @api, @message = api, message
    end

    def call
      messenger.send_text(parsed_response)
    end

    private

    def messenger
      @messenger ||= Messenger.new(api: api, chat_id: message.chat.id)
    end

    def parsed_response
      @parsed_response ||= CommandsManager.new(message: message, messenger: messenger).call
    end
  end
end
