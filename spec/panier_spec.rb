require "spec_helper"
require "panier"

RSpec.describe Panier do
    describe "#" do
        it "return 'Le panier'" do
            panier = described_class.new
            expect(panier.??).to eql("")
        end
    end 
  
end    