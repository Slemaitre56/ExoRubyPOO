require "tilt"
require "erb"
require "./lib/panier"

class Router
  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params


   
    case path
    when "/"
      template = Tilt.new("index.html.erb")
      [200, { "Content-type" => "text/html" }, 
      template.render(
        self,
        fruit: @fruit,
        total: @panier.total,
        panier: @panier.fruit_dico
      )
    ]
    when "/panier"

    else

    end
  end
end
