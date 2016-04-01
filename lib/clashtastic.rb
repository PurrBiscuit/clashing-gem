require "httparty"

class Clashtastic
  def initialize(jwt_token)
    @jwt_token = jwt_token
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
    HTTParty.get(clash_uri, :headers => {'Authorization' => 'Bearer ' + @jwt_token})
  end

  #Clan Things
  def search_clans(*args)
    path = "clans"
    if args.count == 1
      query = args[0]
    else
      query = args.join("&")
    end
    query.gsub(" ", "%20")

    self.query(path, query)
  end

  def clan_info()

  end

  def list_members()

  end

  #Location Things
  def list_locations()

  end

  def location_info()

  end

  def location_rankings()

  end

  #League Things
  def list_leagues()

  end
end
