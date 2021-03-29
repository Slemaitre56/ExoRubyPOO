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
    #p "Votre panier est de : #{total}"
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
    p "Vous avez ajouté : #{item_fruit} à votre panier !"
    # reduction du fruit
    reduc = item_fruit.instance_variable_get(:@reduc)
    # somme de tout les fruits
    total = @cart.flatten.map(&:price).sum
    p total -= reduc if @fruit_dico["Banane"] > 1
    p total -= reduc if @fruit_dico["Cerise"] > 1
    p total -= reduc if @fruit_dico["Mele"] > 1
    p total -= reduc if @fruit_dico["Apple"] > 2
    p "Votre panier est de : #{total}"
  end
end
