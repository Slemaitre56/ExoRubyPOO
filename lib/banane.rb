class Banane < Fruits
  @price = 150
  @reduc = 150

  def initialize
    @price = price
  end

  def reduce_price
    fruit_dico["Banane"] < 1 ? @price - @reduc : 0
  end
end
