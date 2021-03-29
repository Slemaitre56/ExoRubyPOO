class Mele < fruits
  @price = 100
  @reduc = 50

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Mele"] < 1 ? @price - @reduc : 0
  end
end
