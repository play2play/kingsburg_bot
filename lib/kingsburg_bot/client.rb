module KingsburgBot
  class Client
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def start
      begin
        respond
      rescue Telegram::Bot::Exceptions::ResponseError => exception
        puts exception
        sleep 1
        retry # run again on telegram server error
      end
    end

    private

    def run_client(&block)
      Telegram::Bot::Client.run(token) do |bot|
        yield bot if block_given?
      end
    end

    def respond
      run_client do |bot|
        bot.listen do |message|
          Responder.new(bot.api, message).call if message.text
        end
      end
    end

    def get_updates(bot, next_offset)
      bot.api.getUpdates(offset: next_offset, timeout: 20)
    end
  end
end
