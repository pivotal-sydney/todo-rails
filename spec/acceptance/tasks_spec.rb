require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Tasks" do
  get "/api/v1/tasks" do
    example "Should return 200" do
      do_request

      expect(status).to eq(200)
    end
  end
  get "/api/v1/tasks" do
    example "Should list tasks in JSON" do
      Task.create! description: "This is the first task"
      Task.create! description: "This is the second task"
      do_request

      expect(response_body).to eq([
        {"id":1,"description":"This is the first task"},
        {"id":2,"description":"This is the second task"}].to_json)
    end
  end


end
