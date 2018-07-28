class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todos = Todo.all
    @todo = Todo.find(params[:id])
    @user = User.all
    @starus = Status.all
  end
end
