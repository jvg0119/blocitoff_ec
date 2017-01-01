require 'rails_helper'

feature "Viewing the TODO list" do 
	 let(:user) { create(:user) }
	 let(:todo) { create(:todo, user: user) }
	before do
		#@todo = create(:todo, user: user) ## OK
		todo 
		sign_in(user)
		# @todo = create(:todo, user: user) ## why it does not work when you create todo after signing in
	end
	scenario "shows the TODOs" do
#		 user = create(:user) ## OK
#		 todo = create(:todo, user: user)
#		 sign_in(user)
		
		# visit user_path(user) ## remove not needed; after signin it goes to user show page
#		byebug
		expect(page).to have_content(todo.description)
		expect(page).to have_content(todo.days_left)
		expect(page).to have_link('glyphicon-ok-#{todo.id}') #(id-of-link)
	#	save_and_open_page 
	end
	scenario "shows the days left up to 7 days after the date of creation" do


	end

end


 
 ## need to create spec for verify days_left; put this in list_todos_spec

