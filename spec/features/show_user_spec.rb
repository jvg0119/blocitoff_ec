require 'rails_helper'

feature "Viewing a user's individual profile" do 
	scenario "show the user's details" do 
		user = create(:user)
	
		visit user_path(user)	
	
		expect(page).to have_content("Joe")
		expect(page).to have_content(user.email)
		# save_and_open_page
	end
end


