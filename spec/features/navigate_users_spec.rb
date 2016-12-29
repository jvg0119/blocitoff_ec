require 'rails_helper'

feature "Navigating users" do 
	scenario "allows navigation from listing page to the detail page" do 
		user = create(:user)

		visit users_path

		expect(current_path).to eq(users_path)

		click_link(user.name)

		expect(current_path).to eq(user_path User.last)
		expect(page).to have_content("Joe")
		expect(page).to have_content(user.email)
		#save_and_open_page
	end
	scenario "allows navigation from the detail page to the listing page" do 
		user = create(:user)

		visit user_path(user)

		click_link "Users"

		expect(current_path).to eq(users_path)
		expect(page).to have_content("Joe")
		# save_and_open_page
	end
end

