require 'google_o_auth_api_client'

class SessionsController < ApplicationController

  def find_or_create
    oauth_token = params.fetch(:oauth_token)

    email = GoogleOAuthApiClient.get_email oauth_token

    api_token = SecureRandom.hex

    User.create!({api_token: api_token})

    render status: :ok, json: {api_token: api_token}
  end

end
