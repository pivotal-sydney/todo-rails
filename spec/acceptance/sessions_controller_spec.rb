require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Sessions" do

  put "/api/v1/sessions" do
    example "Logging in for the first time" do
      expect(GoogleOAuthApiClient).to receive(:get_email).with("the-oauth-token").and_return("user@example.com")
      do_request({oauth_token: "the-oauth-token"})
      expect(status).to eq(200)


      json = JSON.parse(response_body, symbolize_names: true)
      expect(json[:api_key]).to not_be_nil
      expect(json[:api_key]).to eq(User.last!.api_key)
    end
  end
end
