class TodosController < ApplicationController

  def index
  end

  def show
  	@todo = Todo.find(params[:id])
  	#byebug
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.new(todo_params)
  	#byebug
  	if @todo.save
  	  flash[:notice] = "Your new TODO was saved successfully!"
  	  redirect_to todo_path @todo#, :notice => "Your new TODO was saved successfully!" #why it does not work?
  	else
  	  flash[:error] = "There was an error creating your todo. Please try again."
  	  render :new
  	end
  end

private

  def todo_params
  	params.require(:todo).permit(:description)
  end

end

