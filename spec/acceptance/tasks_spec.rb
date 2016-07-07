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
      expect(json[:tasks].count).to eq(2)

      expect(json[:tasks][0][:description]).to eq ("This is the first task")
      expect(json[:tasks][1][:description]).to eq ("This is the second task")
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

  patch "/api/v1/tasks/:id" do
    let(:task) { Task.create! description: "Original Description" }
    let(:id) { task.id }
    example "Should update task description" do
      do_request({task: {description: "New Description"}})
      expect(status).to be 200
      expect(Task.last.description).to eq("New Description")

      json = JSON.parse(response_body, symbolize_names: true)
      expect(json[:description]).to eq ("New Description")
    end
  end


  delete "/api/v1/tasks/:id" do
    let(:task) { Task.create! description: "Original Description" }
    let(:id) { task.id }
    example "Should be removed" do
      do_request()
      expect(status).to be 204
      expect(Task.count).to eq 0
    end
  end

end
