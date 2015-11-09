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
    #if @word.index(guess) != nil
    #  found = false
    #  @guesses.each_char do |char|
    #    if char == guess
    #      found = true
    #    end
    #  end
    #  if !found
    #    @guesses << guess
    #  end
    #else
    #  found = false
    #  @wrong_guesses.each_char do |char|
    #    if char == guess
    #      found = true
    #    end
    #  end
    #  if !found
    #    @wrong_guesses << guess
    #  end
    #  
    #end
    
  end
  
  #def check_win_or_lose
  #end
  
  #def word_with_guesses
  #end
  
end
