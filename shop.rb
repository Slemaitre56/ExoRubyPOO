require "./lib/panier"

panier ||= Panier.new

ARGF.each do |argument|
  argument = argument.chomp
  panier.fruit_basket(argument)
end
