class Cerise < Fruits
  @price = 75
  @REDUC = 20

  def initialize
    @price = price
  end

  def reduce_price
    if fruit_dico['Cerise'] < 1 ? @price - @REDUC : 0; end
  end
end
