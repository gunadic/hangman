require_relative '../lib/word'

describe Word do

  it "contains a random word once initialized" do
    temp = Word.new
    expect(temp.the_word).to_not eql(nil)
  end

  it "contains an array with an underscore for every letter" do
    temp = Word.new
    expect(temp.the_word.length==temp.display_array.size).to eql(true)
  end

end