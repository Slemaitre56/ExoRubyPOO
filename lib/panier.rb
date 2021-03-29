require "./lib/fruits"
require "./lib/pomme"
require "./lib/apple"
require "./lib/mele"
require "./lib/cerise"
require "./lib/banane"

class Panier
  def initialize
    @sum = 0
    @fruit_dico = {
      "Pomme" => 0,
      "Apple" => 0,
      "Mele" => 0,
      "Banane" => 0,
      "Cerise" => 0
    }
    @cart = []
  end

  def fruit_basket(argument)
    total_cart(argument)
    total_price(argument)
    total = @cart.flatten.map(&:price).sum
    reduc = @cart.flatten.map(&:reduc)
    @fruit_dico["Cerise"] < 1 ? total - reduc : total

    p "Votre panier est de : #{total}"
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
    prix = item_fruit.instance_variable_get(:@price)
    p "Vous avez ajouté : #{item_fruit} à votre panier !"
    p "Son prix est de : #{prix} centimes"
  end
end
