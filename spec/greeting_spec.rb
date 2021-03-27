require "spec_helper"
require "greeting"

RSpec.describe Greeting do
    describe "#hello", :focus do
        it "return 'Hello World'" do
            greeting = described_class.new
            expect(greeting.hello).to eql("Hello World")
        end
    end 

    describe "#good_bye" do
        it "return 'Good bye John'" do
            greeting = described_class.new
            expect(greeting.good_bye("John")).to eql("Good bye John")
        end
    end    
end    