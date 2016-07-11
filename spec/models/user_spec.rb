require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have an api token" do
    user = User.new(api_token: 'the-api-token')
    expect(user.api_token).to eq('the-api-token')
  end

end
