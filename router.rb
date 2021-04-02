require "./lib/controller"
require "pry"

class Router

  def controller
    @controller ||= Controller.new
  end  

  def call(env)
    path = env["REQUEST_PATH"]
    req = Rack::Request.new(env)
    body = req.body.gets
    params = {}
    params.merge!(body ? JSON.parse(body) : {})
    controller.params = params

    case path
    when "/"
      controller.index
    when "/panier"
      controller.basket
    else
      controller.no_found
    end
  end
end
