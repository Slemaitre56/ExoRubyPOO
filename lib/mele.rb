class Mele < Fruits
  @reduc = 50
  attr_reader :price
  def initialize
    @price = 100
  end
end
