module KingsburgBot
  module CommandsKeeper
    COMMANDS = %i(test)

    def test
      'Wow, I\'m using telegram bot!'
    end

    def help
      # Put some help info here
    end

    private

    def has_command?(command)
      COMMANDS.include?(command)
    end
  end
end
