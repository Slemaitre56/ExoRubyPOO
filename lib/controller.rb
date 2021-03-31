require "json"
require "tilt"
require "erb"
require "./lib/panier"
require "./lib/shop"
require "pry"

class Controller
 attr_accessor :params
 # def dbb
   # dbb =SQLite3::Database.new("./myshopDB.db")
    #items = dbb.execute("SELECT name, price FROM products")
   # item ={}
    #items.each { |i| item.store(i[0],i[1])} 
    #binding.pry
  #end  

  def index
    
    @total = panier.total
    @panier_dico = panier.fruit_dico

    render({fruit: @fruit, total: @total, panier_dico: @panier_dico})
  end

  def basket
    
    @fruit = params.values[0]
    panier.fruit_basket(@fruit)
    redirect("/")
  end

  def clear
    panier.clear
    redirect("/")
  end

  def no_found
    render({}, 404)
  end

  private

  def panier
    @panier ||= Panier.new
  end

  def render(params, code=200)
    file = caller_locations(1,1)[0].label
    template = Tilt.new("./lib/views/#{file}.html.erb")

    [
      code, 
      {"Content-Type" => "text/html"}, 
      template.render(
        self, 
        params
      )
    ]  
  end

  def render_json(params, code=200)
    [
      code, 
      {"Content-Type" => "application/json"}, 
      [params.to_json]
    ]  
  end

  def redirect(to)
    [302, {'Location' => to}, []]
  end
end