require "./lib/fruits"
require "./lib/pommes"
require "./lib/apples"
require "./lib/meles"
require "./lib/cerises"
require "./lib/bananes"
require "./lib/poires"
require "./lib/kiwi"
require "./lib/fraises"
require "./lib/shop"
class Panier
  attr_accessor :fruit_dico, :total, :cart
  def initialize
    @total = 0    
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
    @prix_fruit = []

  end

  def fruit_basket(argument)
    total_cart(argument)
    total_price(argument)
  end

  def total_cart(argument)
    @cart <<
      argument.split(",").map do |item|
        item.strip!
        p fruit = Object.const_get(item).new
        @fruit_dico[item] += 1
        fruit
      end
  end

  def total_price(name)
    name_fruit = Shop::find_by_name(name).name
    item_fruit = Object.const_get(name_fruit)
    reduc = item_fruit.instance_variable_get(:@reduc)
    @prix_fruit << Shop::find_by_name(name).price
    p @total = @prix_fruit.sum
    p @total -= @fruit_dico["Bananes"] / 2 * reduc
    p @total -= @fruit_dico["Apples"] / 3 * reduc 
    p @total -= @fruit_dico["Cerises"] / 2 * reduc 
    p @total -= @fruit_dico["Meles"] / 2 * reduc 
    
  end

  def clear(argument)
    @cart =[]
  end
end
