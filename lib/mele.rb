class Mele < fruits
  @price = 100
  @REDUC = 50

  def initialize
    @price = price
  end

  def reduce_price
    if fruit_dico['Mele'] < 1 ? @price - @REDUC : 0; end
  end
end
