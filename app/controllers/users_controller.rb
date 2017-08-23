class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  # def index
  # 	@users = User.all
  # end

  def show
  #	@user = User.find(params[:id]) # coming fr require_correct_user
    @todos = @user.todos
  end

  def new
    if !current_user
  	@user = User.new
  else
    flash[:alert] = "Please sign out first."
    redirect_to root_url
  end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		#byebug
  		session[:user_id] = @user.id
  		flash[:notice] = "Your user account was created successfully!"
  		redirect_to @user
  	else
  		flash[:error] = "There was an error creating your user account. Please try again."
  		render :new
      # redirect_to root_url
  		#byebug
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = "Your user account was updated successfully!"
			redirect_to @user
		else
			flash[:error] = "There was an error updating your user account. Please try again."
			render :edit
		end
  end

  def destroy
  	# @user = User.find(params[:id])
  	@user.destroy
  	session[:user_id] = nil
  	flash[:notice] = "Your user account was deleted!"
  	redirect_to root_url
  end

private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_correct_user
  	@user = User.find(params[:id])
  	unless current_user == @user
      flash[:alert] = "Access not authorized!"
  		redirect_to root_url
  	end
  end

end
