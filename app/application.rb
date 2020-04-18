class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/")[-1]
      if item = @@items.detect {|item| item.name == item_name}
        resp.write "#{item.price}"
      else
        # resp.status = 400
        resp.write "Item not found"
         resp.status = 400
      end
    else
      # resp.status = 404
      resp.write "Route not found"
       resp.status = 404
    end
    resp.finish
  end
end