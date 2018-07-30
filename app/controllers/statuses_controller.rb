class StatusesController < ApplicationController
  before_action :findstatus, only: [:complete, :update, :edit]
  before_action :authenticate_user!

  def index
    @status = current_user.statuses
    @user = User.all
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @status = Status.find_by(todo: @todo, user: current_user)
    if @starus == nil
      @starus = Status.create(todo: @todo, user: current_user)
    end
    if @starus.save
      redirect_to root_path, notice: 'Has completado esta tarea'
    else
      redirect_to root_path, alert: 'No se ha podido marcar como completada esta tarea'
    end
  end

  def edit
  end

  def update
    @status.update(status_params)
    redirect_to statuses_path
  end

  def complete
    @status.status = true
    @status.save
    redirect_to statuses_path
  end

  private
  def status_params
    params.require(:status).permit(:status)
  end

  def findstatus
    @status = Status.find(params[:id])
  end
end
