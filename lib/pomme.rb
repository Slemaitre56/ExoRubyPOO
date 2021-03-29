class Pomme < Fruits
  @reduc = 0
  attr_reader :price
  def initialize
    @price = 100
  end
end
