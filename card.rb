class Card
  attr_reader :suit, :type
  attr_accessor :value
  def initialize(suit, type, value)
    @suit = suit
    @type = type
    @value = value
  end

  def to_s
    "#{@type} of #{@suit}"
  end
end
