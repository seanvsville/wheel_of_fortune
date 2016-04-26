class WheelOfFortune
  attr_reader :theme, :guesses

  def initialize(guess)
    @theme = guess[:theme]
    @phrase = guess[:phrase]
    @guesses = []
    @remaining_characters = unique_chars
  end

  def to_s
    return @phrase if game_over?
    @phrase.gsub(unguessed, "_")
  end

  def can_i_have?(input)
    @guesses << input.downcase
    @phrase.downcase.include? input.downcase
  end

  def game_over?
    @remaining_characters.empty?
  end

  def unguessed
    Regexp.new(@remaining_characters.join('|'), Regexp::IGNORECASE)
  end

  def unique_chars
    @phrase.downcase.delete("^a-z").split("").uniq
  end

  def add_guess(gess)
    @guesses << gess unless gess.empty?
  end

  def good_guess?(char)
    !!(add_gess(char) && @remaining_characters.delete(char))
  end

#end of Class WheelOfFortune
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
