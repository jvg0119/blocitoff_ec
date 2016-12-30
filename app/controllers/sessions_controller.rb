class SessionsController < ApplicationController

  def new
  end

  def create
  	# user = User.find_by email: params[:email]
  	# if user && user.authenticate(params[:password]) 
    #byebug
    if user = User.authenticated(params[:email], params[:password]) 

  		session[:user_id] = user.id
  		flash[:notice] = "You are now signed in." 
  		redirect_to user_path user 
  	else
  		flash[:error] = "There was an error signing in. Please try again."   		
  		render :new
  	#	byebug
  	end
  end

  def destroy
  	session[:user_id] = nil 
  	flash[:notice] = "You are now signed out."
  	redirect_to root_url
  end

end
