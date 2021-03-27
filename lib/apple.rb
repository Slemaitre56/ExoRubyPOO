require "pry"

class Apple < Fruits

    @price = 100
    @REDUC = 100 

    def initialize
        @price = price
    end

    def reduce_price
         if fruit_dico["Apple"] < 2 ? @price - @REDUC : 0; end
    end


end