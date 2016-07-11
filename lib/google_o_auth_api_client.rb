require 'rest-client'

class GoogleOAuthApiClient


  def self.get_email(api_token)
    response = RestClient.get "https://www.googleapis.com/plus/v1/people/me?access_token=#{api_token}"
    JSON.parse(response.body)["emails"][0]["value"]
  end
end
