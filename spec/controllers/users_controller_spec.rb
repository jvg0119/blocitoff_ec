require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_todo) { create(:todo, user: my_user) }

  context "when not signed in" do  # before_action :require_signin
  	it "cannot access GET #index and redirects to sign in page" do
  		get :index

  		expect(response).to redirect_to(new_session_url)
  		# puts response.body
  	end
  	it "cannot access GET #show redirects to sign in page" do
      #user = create(:user)
      get :show, params: { id: my_user.id }

      expect(response).to redirect_to(new_session_url)
    end
    it "cannot access GET #edit and edirects to sign in page" do
    	get :edit, params: { id: my_user.id }

    	expect(response).to redirect_to(new_session_url)
    end
    it "cannot access POST #update and redirects to sign in page" do
  		get :edit, params: { id: my_user.id }

  		expect(response).to redirect_to(new_session_url)
	 end
	it "cannot access DELETE #destroy and redirects to sign in page" do
  		get :edit, params: { id: my_user.id }

  		expect(response).to redirect_to(new_session_url)
    end
  end # context when not signed in

  context "when signed in as the wrong user" do # before_action :require_correct_user
  	let(:wrong_user) { create(:user, name: "Mike", email: 'mike@example.com') }
  	before(:example) do
  		session[:user_id] = wrong_user
  	end
    it "cannot GET #show the another user's profile" do
      get :show, params: { id: my_user.id }

      expect(response).to redirect_to(root_url)
    end
  	it "cannot GET #edit another user" do
  		get :edit, params: { id: my_user.id }

  		expect(response).to redirect_to(root_url)
  		#puts response.body
    end
  	it "cannot PUT #update another user" do
  		patch :update, params: { id: my_user.id }

  		expect(response).to redirect_to(root_url)
  	end
  	it "cannot DELETE #destroy another user" do
  		delete :destroy, params: { id: my_user.id }

  		expect(response).to redirect_to(root_url)
  	end
  end # context when signed in as the wrong user

  context "when signed in as the correct user" do
    before(:example) do
      session[:user_id] = my_user
    end
    describe "GET #show" do
      before { get :show, params: { id: my_user.id } }
      it "returns an http success" do
        expect(response).to have_http_status(:success)
      end
      it "assigns my_user to @user" do
        expect(assigns(:user)).to eq(my_user)
      end
      # move this later to todos_controller_spec.rb
      it "assigns my_todo item to @todos" do
        expect(assigns(:user).todos).to eq([my_todo])
      end
      it "renders the user's show template" do
        expect(response).to render_template(:show)
      end
    end
    describe "GET #edit" do
      before { get :edit, params: { id: my_user.id } }
      it "returns an http success" do
        expect(response).to have_http_status(:success)
      end
      it "assigns the my_user to @user" do
        expect(assigns(:user)).to eq(my_user)
      end
      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end
    describe "PUT #update" do
      it "updates user with the expected attributes" do
        updated_user_name = "New name"
        updated_user_email = "updatedemail@example.com"
        updated_user_password = "newpassword"
        put :update, params: { id: my_user.id, user: attributes_for(:user, name: updated_user_name, email: updated_user_email, password: updated_user_password) }
        expect(assigns(:user).name).to eq(updated_user_name)
        expect(assigns(:user).email).to eq(updated_user_email)
        expect(assigns(:user).password).to eq(updated_user_password)
      end
      it "redirects to the updated user" do
        put :update, params: { id: my_user.id, user: attributes_for(:user) }
        expect(response).to redirect_to(my_user)
      end
    end
    describe "DELETE #destroy" do
      before { delete :destroy, params: { id: my_user.id } }
      it "deletes the user" do
        expect(User.where(id: my_user.id).size).to eq(0)
      end
      it "redirects to root_url" do
        expect(response).to redirect_to(root_url)
      end
    end
  end   # when signed in as the correct user

end

# DEPRECATION WARNING: You are passing an instance of ActiveRecord::Base to `find`. Please pass the id of the object by calling `.id`.
# cannot find the answer to fix this ??
