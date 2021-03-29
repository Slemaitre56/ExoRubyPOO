class Cerise < Fruits
  @price = 75
  @REDUC_FRUIT = 20

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Cerise"] < 1 ? @price - @REDUC_FRUIT : 0
  end
end
