class TasksController < ApplicationController
  def index
    render json: Task.all, :only => [:id, :description]
  end
end
