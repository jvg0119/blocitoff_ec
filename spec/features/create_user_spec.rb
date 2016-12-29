require 'rails_helper'

feature "Creating a new user" do 
	scenario "saves the user to the database and shows the user's details" do
		visit root_url
		
		click_link("Sign Up")
		
		expect(current_path).to eq(new_user_path)
		
		fill_in('Name', with: 'My new name')
		fill_in('Email', with: 'new@example.com')
		fill_in('Password', with: 'password')
		fill_in('Password confirmation', with: 'password')
		
		click_button("Create User")
		
		expect(current_path).to eq(user_path(User.last))
		expect(page).to have_content("My new name")
		expect(page).to have_content('new@example.com')

		expect(page).to have_link(User.last.name) # testing signing in after creating an account
		expect(page).to have_link("Sign Out")
		#save_and_open_page
	end
	scenario "with invalid attributes does not save the user and re-renders back to the new form" do 
		visit root_url

		click_link("Sign Up")
		
		expect(current_path).to eq(new_user_path)
		
		fill_in('Name', with: '')
		fill_in('Email', with: 'new@example.com')
		fill_in('Password', with: 'password')
		fill_in('Password confirmation', with: 'password')
		
		click_button("Create User")	
		
		expect(page).to have_content("There was an error creating your user account. Please try again.")
		# expect(current_path).to eq(users_path) ## (new_user_path) why this don't work?
	    # save_and_open_page
	end
	scenario "with invalid attributes does not save the user and re-renders back to the new form (another method)" do 
		visit new_user_path # sign up form

		expect { click_button("Create User") }.to_not change{ User.count }
		expect(page).to have_content("There was an error creating your user account. Please try again.")
		# save_and_open_page
	end

end



