require "./lib/panier"

ARGF.each do |argument|
  argument = argument.chomp
  panier = Panier.new(argument)
  panier.fruit_basket(argument)
end
