require "httparty"

class Clashtastic
  def initialize(jwt_token)
    @jwt_token = jwt_token
  end

  def query(query)
    HTTParty.get("https://api.clashofclans.com/v1/#{query}", :headers => {'Authorization' => 'Bearer ' + @jwt_token})
  end

  #Clan Things
  def search_clans()

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
