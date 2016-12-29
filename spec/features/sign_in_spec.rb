require 'rails_helper'

feature "Signing in" do 
	scenario "prompts for an email and a password" do 
		visit root_url
	
		click_link "Sign In"
	
		expect(page).to have_field("Email")
		expect(page).to have_field("Password")
		# save_and_open_page
		#byebug
	end
	scenario "signs in the user if he has a valid email and password combination" do 
	
		# user = create(:user) #, email: 'joe@example.com')
		# visit root_url
		# click_link "Sign In"
		# fill_in('Email', with: user.email) #'joe@example.com')
		# fill_in('Password', with: user.password) #'password')
		# click_button("Sign In")

		user = create(:user)
		sign_in(user)	

		expect(current_path).to eq(user_path(user))
		expect(page).to have_content("Joe")
		expect(page).to have_content(user.email)  #"joe@example.com")

		expect(page).to have_link("Sign Out")	   
		expect(page).to have_link(user.name)

		expect(page).to have_no_link("Sign Up")	   
		expect(page).to have_no_link("Sign In")	   
		# save_and_open_page
	end
	scenario "does not sign in the user if he does not have a valid email and/or password combination" do
		user = create(:user) #, email: 'joe@example.com' )

		visit root_url

		click_link("Sign In")

		fill_in('Email', with: user.name) # 'joe@example.com')
		fill_in('Password', with: 'no match')	

		click_button("Sign In")

		expect(current_path).to eq(session_path)	
		expect(page).to have_content("There was an error signing in. Please try again.")

		expect(page).to have_no_link("Sign Out")	   
		expect(page).to have_no_link(user.name)

		expect(page).to have_link("Sign Up")	   
		expect(page).to have_link("Sign In")	   
		# save_and_open_page
	end

end




