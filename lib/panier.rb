require "./lib/fruits"
require "./lib/pomme"
require "./lib/apple"
require "./lib/mele"
require "./lib/cerise"
require "./lib/banane"

class Panier
  def initialize(fruit_dico)
    @sum = 0
    @fruit_dico = {
      "Pomme" => 0,
      "Apple" => 0,
      "Mele" => 0,
      "Banane" => 0,
      "Cerise" => 0,
    }
  end

  def fruit_basket(argument)
    cart =
      argument.split(",").map do |item|
        item.strip!
        fruit = Object.const_get(item).new
        @fruit_dico[item] += 1
        fruit
      end
    total_price(argument)
    p @sum
  end

  def total_price(argument)
    item_fruit = Object.const_get(argument)
    prix = item_fruit.instance_variable_get(:@price)
    #p item_fruit.instance_method(:reduce_price)
    p "Vous avez ajouté : #{item_fruit} à votre panier ! Son prix est de : #{prix} centimes"
    p @sum += prix
  end
end
