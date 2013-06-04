require 'random-word'

class Word
  attr_accessor :the_word, :display_array
  def initialize
    temp = rand(3)
    if temp == 0
      @the_word = RandomWord.adjs.next
    elsif temp == 1 
      @the_word = RandomWord.nouns.next
    elsif temp == 2
      @the_word = RandomWord.phrases.next
    end

    @display_array = []
    @the_word.length.times do @display_array << "_" end
  end





end