class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todos = Todo.all
    @todo = Todo.find(params[:id])
    @user = User.limit(5)
    @starus = Status.all
  end
end
