class TodosController < ApplicationController
  def index
  end

  def show
    @todo = Todo.find(params[:id])
    @user = User.all
    @starus = Status.all
    @s = Status.where(todo_id: params[:id], status: :true).limit(5).order(updated_at: :asc)
  end
end
