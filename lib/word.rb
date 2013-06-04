require 'pry'
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
    @filled = false
  end

  def check_guess input
    locations = @the_word.split(//).each_with_index.map {|a,i| a == input ? i : nil }.compact
    binding.pry
    if locations.length == nil
      false
    else
      locations.each { |x| 
        @display_array[x.to_i] = input
      }
      true
    end
  end

end