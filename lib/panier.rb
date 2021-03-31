require "./lib/fruits"
require "./lib/pomme"
require "./lib/apple"
require "./lib/mele"
require "./lib/cerise"
require "./lib/banane"
require "./lib/poire"
require "./lib/kiwi"
require "./lib/fraise"

class Panier
  attr_accessor :fruit_dico, :total, :cart
  def initialize
    @sum = 0
    @fruit_dico = {
      "Pommes" => 0,
      "Apples" => 0,
      "Meles" => 0,
      "Bananes" => 0,
      "Kiwi" => 0,
      "Fraises" => 0,
      "Poires" => 0,
      "Cerises" => 0
    }
    @cart = []
    @total = 0
  end

  def fruit_basket(argument)
    total_cart(argument)
    total_price(argument)
  end

  def total_cart(argument)
    @cart <<
      argument.split(",").map do |item|
        item.strip!
        fruit = Object.const_get(item).new
        @fruit_dico[item] += 1
        fruit
      end
  end

  def total_price(argument)
    item_fruit = Object.const_get(argument)
    reduc = item_fruit.instance_variable_get(:@reduc)
    @total = @cart.flatten.map(&:price).sum
    @total -= reduc if @fruit_dico["Banane"] > 1
    @total -= reduc if @fruit_dico["Cerise"] > 1
    @total -= reduc if @fruit_dico["Mele"] > 1
    @total -= reduc if @fruit_dico["Apple"] > 2
  end
end
