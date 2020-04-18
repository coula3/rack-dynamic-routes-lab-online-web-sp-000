class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name == req.path.match(/items/)[-1]
      if item = @@items.find {|item| item.name == item_name}
        resp.write "#{item.price}"
      else
        resp.write = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
end