require 'rails_helper'

feature "Signing out" do 
	scenario "removes the user id from the session" do 
		user = create(:user)
		sign_in(user)
		
		click_link("Sign Out")
	
		expect(current_path).to eq(root_path)
		expect(page).to have_link("Sign Up")
		expect(page).to have_link("Sign In")

		expect(page).to have_no_link("Sign Out")
		expect(page).to have_no_link(user.name)

	end
end


