require 'rails_helper'

feature "User deletes TODO" do

	scenario "successfully" do 
		user = create(:user)
		todo = create(:todo, user: user)
		sign_in(user)

		expect(current_path).to eq(user_path(user))

		expect(page).to have_link('glyphicon-ok-#{todo.id}') #(id-of-link)

		expect { click_on('glyphicon-ok-#{todo.id}') }.to change { Todo.count }.by(-1)
		#save_and_open_page
	end
	scenario "successfully using ajax" do 
		user = create(:user)
		todo = create(:todo, user: user)	
		sign_in(user)

		expect(page).to have_content(todo.description)

		expect(page).to have_link('glyphicon-ok-#{todo.id}') #(id-of-link)

		click_on('glyphicon-ok-#{todo.id}')

		expect(page).to_not have_content(todo.description)		
		# save_and_open_page
	end
end

