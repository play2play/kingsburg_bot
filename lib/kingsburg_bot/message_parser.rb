module KingsburgBot
  class MessageParser
    attr_reader :message

    def initialize(message)
      @message = message
    end

    def command
      parse_message.first.to_sym
    end

    def params
      parse_message { |words| words.drop(1) } || []
    end

    private

    def parse_message
      if  message_present? && message_starts_with_slash?
        message.text[1..-1].split(' ')
      end
    end

    def message_present?
      message.text && message.text.length > 1
    end

    def message_starts_with_slash?
      message.text[0] == '/'
    end
  end
end
