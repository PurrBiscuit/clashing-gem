require "httparty"

class Clashtastic

  @@vars_path = File.dirname(__FILE__) + '/vars'

  def initialize(options = {})
    if options.has_key?(:jwt_token)
      @jwt_token = options[:jwt_token]
      puts "Loading jwt_token from value passed in to the initialize method"
    elsif ENV.has_key?('CLASH_JWT_TOKEN')
      @jwt_token = ENV['CLASH_JWT_TOKEN']
      puts "Loading jwt_token from the CLASH_JWT_TOKEN Environment Variable"
    elsif File.exists?("#{@@vars_path}/jwt_token")
      @jwt_token = File.read("#{@@vars_path}/jwt_token").strip
      puts "Loading jwt_token from the vars/jwt_token file"
    else
      raise "jwt_token missing; please set it as an env var, in the vars/jwt_token file, or pass it directly into the initialize method"
    end
  end

  def query(path, query)
    clash_uri = URI::HTTPS.build(
      {
        :host => "api.clashofclans.com",
        :path => "/v1/#{path}",
        :query => query
      }
    )
    puts clash_uri
    results = HTTParty.get(clash_uri, :headers => {'Authorization' => 'Bearer ' + @jwt_token})
    results["items"]
  end

  #Clan Things
  def search_clans(*args)
    if args.count == 1
      query = args[0]
    else
      query = args.join("&")
    end
    query.gsub!(" ", "%20")

    self.query("clans", query)
  end

  def clan_info(clantag)
    clantag.gsub!("#", "%23")
    path = "clans/#{clantag}"

    self.query(path, nil)
  end

  def list_members(clantag)
    clantag.gsub!("#", "%23")
    path = "clans/#{clantag}/members"

    self.query(path, nil)
  end

  #Location Things
  def list_locations()
    self.query("locations", nil)
  end

  def location_info(locationid)
    self.query("locations/#{locationid}", nil)
  end

  def location_rankings(locationid, rankingid)
    self.query("locations/#{locationid}/rankings/#{rankingid}", nil)
  end

  #League Things
  def list_leagues()
    self.query("leagues", nil)
  end
end
