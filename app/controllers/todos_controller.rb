class TodosController < ApplicationController
  
  def index
    @todos = Todo.all
  end
  
  def show
    @todo = Todo.find(params[:id])
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
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo has been successfully updated"
      redirect_to todo_path(@todo)
    else
      flash[:notice] = "Please try again"
      render 'edit'
    end
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo has been deleted successfully"
    redirect_to root_path
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
end