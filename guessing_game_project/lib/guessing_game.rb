class GuessingGame

    def initialize(min, max)

        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false

    end

    def num_attempts
        get = @num_attempts 
    end

    def game_over?
        get = @game_over
    end

    def check_num(num)
        if num == @secret_num
            print 'you win'
            @num_attempts += 1
            @game_over = true
        elsif num > @secret_num
            print 'too big'
            @num_attempts += 1
        else 
            print 'too small'
            @num_attempts += 1
        end
    end

    def ask_user
        print 'enter a number'
        user_input = gets.chomp.to_i
        check_num(user_input)
    end

end
