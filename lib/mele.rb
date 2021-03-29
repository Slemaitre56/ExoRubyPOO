class Mele < fruits
  @price = 100
  @REDUC_FRUIT = 50

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Mele"] < 1 ? @price - @REDUC_FRUIT : 0
  end
end
