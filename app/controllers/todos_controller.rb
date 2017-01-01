class TodosController < ApplicationController

#  before_action :

  # def index
  # end

  def show
    @user = User.find(params[:user_id])
    @todos = @user.todos 
  	#byebug
  end

  # def new
  # 	@todo = Todo.new
  # end

  def create
    #byebug
    @user = User.find(params[:user_id])
    @todo = @user.todos.new(todo_params)
  	#@todo = Todo.new(todo_params)
  #	byebug
  	if @todo.save
  	  flash[:notice] = "Your new TODO was saved successfully!"
  	  # redirect_to todo_path @todo#, :notice => "Your new TODO was saved successfully!" #why it does not work?
      redirect_to user_path(@user)
  	else
  	  flash[:error] = "There was an error creating your todo. Please try again."
  	  # render :new
      redirect_to user_path(@user)
  	end
  end

  def destroy
    #@user = current_user
    @user = User.find(params[:user_id])
    #byebug
    @todo = @user.todos.find(params[:id]) 
    @todo.destroy
    redirect_to user_path(@user)


  end



private

  def todo_params
  	params.require(:todo).permit(:description)
  end

end

