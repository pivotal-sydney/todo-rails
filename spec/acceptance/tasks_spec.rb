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
      json = JSON.parse(response_body, symbolize_names: true)
      expect(json[0][:description]).to eq ("This is the first task")
      expect(json[1][:description]).to eq ("This is the second task")
    end
  end

  post "/api/v1/tasks" do

    example "Should create a new task" do
      do_request({task: {description: "This is a description" }})
      expect(status).to be 201
      expect(Task.last.description).to eq("This is a description")

      json = JSON.parse(response_body, symbolize_names: true)
      expect(json[:description]).to eq ("This is a description")
    end

    example "Should not allow a new task with empty description" do
      do_request({task: {description: ""}})
      expect(status).to be 422
    end
  end

end
