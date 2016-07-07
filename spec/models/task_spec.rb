require 'rails_helper'

RSpec.describe Task, type: :model do

  it "should have a description" do
    @task = Task.new(description: 'desc')
    expect(@task.description).to eq('desc')
  end

end
