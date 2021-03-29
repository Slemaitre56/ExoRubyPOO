class Mele < Fruits
  attr_reader :price, :reduc

  def initialize
    @price = 100
    @reduc = 50
  end

  def reduce_price
    fruit_dico["Mele"] < 1 ? @price - @reduc : 0
  end
end
