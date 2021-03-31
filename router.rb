require "./lib/controller"

class Router

  def controller
    @controller ||= Controller.new
  end  

  def call(env)
    path = env["REQUEST_PATH"]
    params = Rack::Request.new(env).params
   
    case path
    when "/"
      controller.index
    when "/panier"
      controller.panier
    else
      controller.no_found
    end
  end
end
