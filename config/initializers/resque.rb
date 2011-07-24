ENV["REDISTOGO_URL"] ||= "redis://redistogo:b99859dd8742c5cdcf23242a6f1bfd55@angler.redistogo.com:9000/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }
Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == "secret"
end