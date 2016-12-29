require 'rails_helper'

feature "Editing a user" do
	scenario "updates the user and show it's updated details" do 
		user = create(:user, name: "John")
		
		visit user_path(user)
		
		expect(current_path).to eq(user_path(user))
		
		click_link("Edit")
		
		expect(current_path).to eq(edit_user_path(user))
		expect(find_field('Name').value).to eq("John") #(user.name)
		
		fill_in('Name', with: 'New John')
		
		click_button("Update User")
		
		expect(page).to have_content("New John")
		# save_and_open_page
	end
	scenario "does not update the user if it is invalid" do 
		user = create(:user, name: "George")
	
		visit user_path(user)
	
		click_link("Edit")
	
		expect(find_field('Name').value).to eq("George")
	
		fill_in('Name', with: "")
	
		click_button("Update User")
	
		expect(page).to have_content("There was an error updating your user account. Please try again.")
		# save_and_open_page
	end	
end

