require "tilt"
require "erb"
require "./lib/panier"

class Router
  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params

    if @panier == nil
      @panier = Panier.new
    end
   
    case path
    when "/"
      template = Tilt.new("index.html.erb")
      [200, { "Content-type" => "text/html" }, 
      template.render(
        self,
        fruit: @fruit,
        total: @panier.total
      )
    ]
    when "/panier"
      @fruit = params.values[0]
      @panier.fruit_basket(@fruit)

      [302, {"Location" => "/"}, []]
    else
      template = Tilt.new("no_found.html.erb")
      [404, { "Content-type" => "text/html" }, template.render]
    end
  end
end
