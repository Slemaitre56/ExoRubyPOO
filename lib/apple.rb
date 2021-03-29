class Apple < Fruits
  @price = 100
  @REDUC_FRUIT = 100

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Apple"] < 2 ? @price - @REDUC_FRUIT : 0
  end
end
