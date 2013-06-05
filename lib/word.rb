require 'pry'
require 'random-word'

class Word
  attr_accessor :the_word, :display_array
  def initialize
    @the_word = RandomWord.adjs.next
    @display_array = []
    @the_word.length.times do @display_array << "_" end
    @filled = false
  end

  def check_guess input
    locations = @the_word.split(//).each_with_index.map {|a,i| a == input ? i : nil }.compact
    if locations.length == 0
      return false
    else
      locations.each { |x| 
        @display_array[x.to_i] = input
      }
      return true
    end
  end

  def check_full
    if @display_array.index("_") == nil
      return true
    else
      return false
    end
  end

end