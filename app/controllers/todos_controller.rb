class TodosController < ApplicationController
  before_action :set_todo, except: [:index, :new, :create, ]
  
  def index
    @todos = Todo.all
  end
  
  def show
  end
  
  def new
   @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo saved successfully"
      redirect_to todo_path(@todo)
    else
      flash[:notice] = "Please try again"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo has been successfully updated"
      redirect_to todo_path(@todo)
    else
      flash[:notice] = "Please try again"
      render 'edit'
    end
  end
  
  def destroy
    @todo.destroy
    flash[:notice] = "Todo has been deleted successfully"
    redirect_to root_path
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
end