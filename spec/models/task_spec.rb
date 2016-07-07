require 'rails_helper'

RSpec.describe Task, type: :model do

  it "should have a description" do
    task = Task.new(description: 'desc')
    expect(task.description).to eq('desc')
  end

  it "should require a description" do
    task = Task.new(description: '')
    expect { task.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end

end
