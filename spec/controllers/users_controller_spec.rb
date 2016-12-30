require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  let(:user) { create(:user) }

  context "when not signed in" do  # before_action :require_signin
  	it "cannot access GET #index and redirects to sign in page" do
  		get :index

  		expect(response).to redirect_to(new_session_url)
  		# puts response.body
  	end
  	it "cannot access GET #show redirects to sign in page" do
      #user = create(:user)
      get :show, params: { id: user.id }

      expect(response).to redirect_to(new_session_url)
    end
    it "cannot access GET #edit and edirects to sign in page" do
    	get :edit, params: { id: user.id }

    	expect(response).to redirect_to(new_session_url)
    end
    it "cannot access POST #update and redirects to sign in page" do
		get :edit, params: { id: user.id }

		expect(response).to redirect_to(new_session_url)
	end
	it "cannot access DELETE #destroy and redirects to sign in page" do
  		get :edit, params: { id: user.id }

  		expect(response).to redirect_to(new_session_url)
  	end
  end # context when not signed in

  context "when signed in as the wrong user" do # before_action :require_correct_user
  	let(:wrong_user) { create(:user, name: "Mike", email: 'mike@example.com') }
  	before(:example) do 
  		session[:user_id] = wrong_user
  	end
  	it "cannot edit another user" do
		get :edit, params: { id: user.id }

		expect(response).to redirect_to(root_url)
		#puts response.body
	end
	it "cannot update another user" do 
		patch :update, params: { id: user.id }	

		expect(response).to redirect_to(root_url)		
	end
	it "cannot delete another user" do 
		delete :destroy, params: { id: user.id }

		expect(response).to redirect_to(root_url)		
	end
  end # context when signed in as the wrong user

end

# DEPRECATION WARNING: You are passing an instance of ActiveRecord::Base to `find`. Please pass the id of the object by calling `.id`.


