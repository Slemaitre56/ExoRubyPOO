class Cerise < Fruits
  attr_reader :price, :reduc

  def initialize
    @price = 75
    @reduc = 20
  end

  def reduce_price
    fruit_dico["Cerise"] < 1 ? @price - @reduc : 0
  end
end
