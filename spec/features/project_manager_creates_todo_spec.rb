require 'rails_helper'

feature 'Project manager creates TODO' do 
	scenario 'successfully' do
		visit new_todo_path

		fill_in 'Description', with: 'My first todo description.'

		click_button 'Save'

		expect(current_path).to eq todo_path(Todo.last)
		expect(page).to have_content('My first todo description.')
		expect(page).to have_content("Your new TODO was saved successfully!")
		# save_and_open_page
	end
	scenario 'fails without the description attribute' do 
		visit new_todo_path

		fill_in 'Description', with: ''

		click_button 'Save'

		expect(page).to have_content("There was an error creating your todo. Please try again.")
		# save_and_open_page
	end

end


