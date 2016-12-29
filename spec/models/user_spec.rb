require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { build(:user) }

	it "is invalid without a name" do
		user.name = ''

		expect(user.valid?).to be false
	end
	it "is invalid without an email" do 
		user.email = ''

		expect(user.valid?).to be false
	end
	it "is invalid if it has an invalid email format" do 
		user.email = 'joe.com'
		user.valid?

		expect(user.errors[:email]).to include("is invalid")
	end
 	it "is invalid with a duplicate email" do 
 		user2 = create(:user, email: 'joe@example.com')
 		user.email = 'joe@example.com'
 		user.valid?

 		expect(user.errors[:email]).to include("has already been taken")
 		# p user.errors.count
 	end
 	it "is invalid without a password" do 
 		user.password = nil
 		user.valid?

 		expect(user.errors[:password]).to include("can't be blank")
 	end
 	it "requires a password confirmation when a password is present" do 
 		user.password = "password"
 		user.password_confirmation = ""
 		user.valid?

 		expect(user.errors[:password_confirmation].any?).to be true
 		expect(user.errors[:password_confirmation]).to include("doesn't match Password") 		
 	end

	it "requires the password confirmation to match the password" do
 		user.password = "password"
 		user.password_confirmation = "pass"
 		user.valid?

 		expect(user.errors[:password_confirmation].any?).to be true
 		expect(user.errors[:password_confirmation]).to include("doesn't match Password") 		
 	end
 	it "does not require a password when updating attributes" do 
 		user 
 		user.update_attribute(:name, "Jake")
 		user.password = ''
 		# user.password_confirmation = 
 		user.valid?
 
 		expect(user.errors.any?).to be false
 		# p user.errors.count
 		# p user.errors.full_messages
 	end
 	it "automatically encrypts the password into the password_digest attribute" do 
 		user.password = "password"

 		expect(user.password_digest.present?).to be true
 	end

end

