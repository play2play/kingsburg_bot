module KingsburgBot
  class CommandsManager
    include CommandsKeeper

    attr_reader :command, :params, :message

    def initialize(args)
      @message = args.fetch(:message)
      @command = detect_command
      @params = parser.params
    end

    def call
      if self.class.instance_method(command).arity == 0
        send command
      else
        send command, params
      end
    end

    private

    def detect_command
      has_command?(parser.command) ? parser.command : :help
    end

    def parser
      MessageParser.new(message)
    end
  end
end
