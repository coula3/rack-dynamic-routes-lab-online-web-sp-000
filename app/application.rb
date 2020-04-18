class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name == req.path.match(/items/)[-1]
      if item = @@items.find {|item| item.name == item_name}
        resp.write "#{item.price}"
      else
        resp.write "the"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end