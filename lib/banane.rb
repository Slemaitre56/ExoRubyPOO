class Banane < Fruits
  @price = 150
  @REDUC_FRUIT = 150

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Banane"] < 1 ? @price - @REDUC_FRUIT : 0
  end
end
