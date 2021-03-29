class Cerise < Fruits
  @price = 75
  @reduc = 20

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Cerise"] < 1 ? @price - @reduc : 0
  end
end
