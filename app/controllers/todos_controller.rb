class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todos = Todo.all
    @todo = Todo.find(params[:id])
    @user = User.all
    @starus = Status.all
    @s = Status.where(todo_id: params[:id], status: :true).limit(5).order(updated_at: :asc)
  end
end
