class Apple < Fruits
  @price = 100
  @reduc = 100

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Apple"] < 2 ? @price - @reduc : 0
  end
end
