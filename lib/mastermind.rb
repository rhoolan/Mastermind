require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        puts "Exact matches: #{@secret_code.num_exact_matches(code)}"
        puts "Near matches: #{@secret_code.num_near_matches(code)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp
        code = Code.from_string(guess)
        print_matches(code)
        @secret_code == code
    end
end
