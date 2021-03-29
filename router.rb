require "tilt"
require "erb"

class Router
  def call(env)
    path = env["REQUEST_PATH"]

    case path
    when "/"
      template = Tilt.new("index.html.erd")
      [200, { "Content-type" => "text/html" }, template.render]
    else
      template = Tilt.new("no_found.html.erd")
      [404, { "Content-type" => "text/html" }, template.render]
    end
  end
end
