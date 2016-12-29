require 'rails_helper' 

feature "Deleting a user" do 
	scenario "removes the user and shows the user list" do 
		user = create(:user)
		
		visit user_path(user)
		
		click_link("Delete")
		
		expect(page).to have_content("Your user account was deleted!")
		expect(current_path).to eq(root_path)

		expect(page).to have_no_link(user.name)
		# save_and_open_page
	end
end
