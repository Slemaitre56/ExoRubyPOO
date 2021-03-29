class Apple < Fruits
  attr_reader :price, :reduc

  def initialize
    @price = 100
    @reduc = 100
  end

  def reduce_price
    fruit_dico["Apple"] < 2 ? @price - @reduc : 0
  end
end
