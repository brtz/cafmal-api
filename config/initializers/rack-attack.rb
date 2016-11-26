class Rack::Attack
  throttle('user_token/ip', :limit => 5, :period => 20.seconds) do |req|
    if req.path == '/user_token' && req.post?
      req.ip
    end
  end


end
