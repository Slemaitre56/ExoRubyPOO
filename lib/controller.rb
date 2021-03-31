require "json"
require "tilt"
require "erb"
require "./lib/panier"
require "./lib/shop"

class Controller
 attr_accessor :params

  def index
    render({fruit: @fruit, total: panier.total, paniers: panier.fruit_dico})
  end

  def panier
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

  def panier
    @panier = Panier.new
  end


  private

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