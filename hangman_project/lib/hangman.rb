class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |lett, idx|
      if lett == char
        arr << idx
      end
    end
    return arr
  end

  def fill_indices(fill_char, fill_arr)
    # new_arr = [] 
  #   @guess_word.each_with_index do |ele, idx| #bootcamp, b,o,o,c,a,m,p
  #     if fill_arr.any?(idx) # [1,2] has any? 0,1,2
  #       @guess_word[idx] = fill_char
  #     end
  #   end
  #   @guess_word
  # end
    fill_arr.each do |idx|
      @guess_word[idx] = fill_char
    end
  end

  def try_guess(char)
    if !already_attempted?(char)
      @attempted_chars << char
      arr = get_matching_indices(char)
      if arr.length > 0
      fill_indices(char, arr)
      else
        @remaining_incorrect_guesses -= 1
      end
      return true
    elsif already_attempted?(char)
      print 'that has already been atempted'
      return false
    end
  end

  def ask_user_for_guess
    print 'Enter a char:'
    guess_char = gets.chomp
    try_guess(guess_char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    else 
      return false
    end
  end

  def game_over?
    print @secret_word
    self.win? || self.lose?
  end
end