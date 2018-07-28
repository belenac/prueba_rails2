class StatusesController < ApplicationController
  before_action :authenticate_user!

  def index
    @status = current_user.statuses
    @user = User.all
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @starus = Status.new(todo: @todo, user: current_user)
    if @starus.save
      redirect_to root_path, notice: 'Has completado esta tarea'
    else
      redirect_to root_path, alert: 'No se ha podido marcar como completada esta tarea'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.update(status_params)
    redirect_to statuses_path
  end

  def complete
    @status = Status.find(params[:id])
    @status.status = true
    @status.save
    redirect_to statuses_path
  end

  def status_params
    params.require(:status).permit(:status)
  end
end