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
