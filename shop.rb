require "./lib/panier"

ARGF.each do |argument|
  argument = argument.chomp
  return if argument == "bye"
  panier = Panier.new(argument)
  panier.fruit_basket(argument)
end
