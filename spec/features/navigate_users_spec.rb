require 'rails_helper'
# removed this feature

# feature "Navigating users" do 
# 	scenario "allows navigation from listing page to the detail page" do 
# 		user = create(:user)

# 		sign_in(user)

# 		visit users_path

# 		expect(current_path).to eq(users_path)

# 		#within('.navbar-right') do    # one is for edit and one is for show page
# 		within('#user_id') do 		   # this is for show page
# 			click_link(user.name)
# 		end

# 		expect(current_path).to eq(user_path User.last)
# 		expect(page).to have_content("Joe")
# 		expect(page).to have_content(user.email)
# 		# save_and_open_page
# 	end
# 	scenario "allows navigation from the detail page to the listing page" do 
# 		user = create(:user)

# 		sign_in(user)

# 		visit user_path(user)

# 		click_link "Users"

# 		expect(current_path).to eq(users_path)
# 		expect(page).to have_content("Joe")
# 		# save_and_open_page
# 	end
# end

