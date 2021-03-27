require "pry"

class Banane < Fruits

    @price = 150
    @REDUC = 150 

    def initialize
        @price = price
    end

    def reduce_price
        #definir count
        if fruit_dico["Banane"] < 1 ? @price - @REDUC : 0;end
    end
end