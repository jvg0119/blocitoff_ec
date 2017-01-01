require 'rails_helper'

RSpec.describe Todo, type: :model do

	describe "validation" do 
		it "is invalid without a description" do 
			todo = create(:todo)
			todo.description = ''
			todo.valid?

			expect(todo.errors[:description]).to include("can't be blank")
		end
	end
	describe "days_left method" do 
		it "gives up to a of maximum 7 days after the todo created_at date" do 
			#todo = create(:todo, created_at: 3.days.ago)
			todo = create(:todo, created_at: 3.days.ago.to_date )
			todo2 = create(:todo, created_at: 5.days.ago.to_date )
			todo3 = create(:todo, created_at: Time.now)

			expect(todo.days_left).to eq( 7 - ((DateTime.now.to_i - 3.days.ago.to_i)/60/60/24.0))
			expect(todo2.days_left).to eq( 7 - ((DateTime.now.to_i - 5.days.ago.to_i)/60/60/24.0))
			expect(todo3.days_left).to eq( 7 - ((DateTime.now.to_i - 0.days.ago.to_i)/60/60/24.0))

			#puts 7.days.ago.to_i #/ 60/60/24/365 
			#puts DateTime.now.to_i# / 60/60/24/365 
			#puts 1.days.ago.to_date
			#puts 7 - ((DateTime.now.to_i - 3.days.ago.to_i)/60/60/24.0)
			#puts todo.days_left
		end
	end
  
end
