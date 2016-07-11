require 'spec_helper'
require 'google_o_auth_api_client'

RSpec.describe GoogleOAuthApiClient do
  it "should get user email" do

    stub_request(:get, "https://www.googleapis.com/plus/v1/people/me?access_token=the-oauth-token").
      to_return(:status => 200, :body => '{"emails": [ { "value": "user@example.com"} ]}', :headers => {"Content-Type" => "application/json"})

    email = GoogleOAuthApiClient.get_email("the-oauth-token")

    expect(email).to eq("user@example.com")
  end
end
