class Recipe
  #Requirements:
  # • Take a keyword to query
  # • Query the Food2Fork API for a result.
  # • Add the HTTP query parameter key (your developer key) to each out-going URL request to http://food2fork.com/api using HTTParty  defaulparams.
  # • Obtain the key value from an environment variable FOOD2FORK KEY
  # • Obtain the url (and/or port) value from an environment variable FOOD2FORK SERVER AND PORT

  include HTTParty

  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || 'www.food2fork.com'

  base_uri "http://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  #default_params key: '5dd3e01252b914e86d945974d90de0b2'
  format :json

  def self.for term
    get("/search", query: {q: term})["recipes"]
  end
end
