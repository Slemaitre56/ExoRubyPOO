class Banane < Fruits
  attr_reader :price, :reduc

  def initialize
    @price = 150
    @reduc = 150
  end

  def reduce_price
    fruit_dico["Banane"] < 1 ? @price - @reduc : @price
  end
end
