require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
        print @secret_code
    end
end
