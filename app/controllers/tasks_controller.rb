class TasksController < ApplicationController
  before_action :authenticate_user, :switch_tenant

  # GET
  def index
    # This could be paginated
    render(json: Task.all.to_json, status: 200)
  end

  # POST
  def create
    task = Task.create(task_params)

    return render(json: { message: 'Task created' }, status: 201) if task.save
    render(json: task.errors, status: 422)
  end

  private

  def switch_tenant
    Apartment::Tenant.switch!(Database.name(current_user.id))
  end

  def task_params
    params.require(:task).permit(:start, :end, :description)
  end
end
