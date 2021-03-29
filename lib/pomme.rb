class Pomme < Fruits
  attr_reader :price, :reduc

  def initialize
    @price = 100
    @reduc = 0
  end

  def reduce_price
    0
  end
end
