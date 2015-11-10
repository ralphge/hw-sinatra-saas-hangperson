class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  attr_accessor :word, :guesses, :wrong_guesses
  
  def guess(guess)
    raise ArgumentError unless guess
    raise ArgumentError unless guess.match(/^[a-zA-z]+$/)
    letter = guess.downcase
    if @word.index(letter) != nil
      if @guesses.index(letter) == nil
        @guesses  = @guesses + letter
        letter
      else
        false
      end
    else
      if @wrong_guesses.index(letter) == nil
        @wrong_guesses = @wrong_guesses + letter
        letter
      else
        false
      end
    end
  end
  
  def check_win_or_lose
    all_found = true
    @word.each_char do |char|
      if guesses.index(char) == nil
        all_found = false
      end
    end

    if all_found
      :win
    elsif @wrong_guesses.length >= 7
      :lose
    else
      :play
    end
  end
  
  def word_with_guesses
    out = ''
    @word.each_char do |char|
      if guesses.index(char)
        out = out + char
      else
        out = out + '-'
      end
    end
    out
  end
  
end
