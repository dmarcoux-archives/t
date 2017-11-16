class TasksController < ApplicationController
  # GET
  def index
    Task.all
  end

  # POST
  def create
    task = Task.create(task_params)

    return render(json: { message: 'Task created' }, status: 201) if task.save
    render(json: task.errors, status: 422)
  end

  private

  def task_params
    params.require(:task).permit(:start, :end, :description)
  end
end
