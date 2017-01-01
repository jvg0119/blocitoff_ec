class User < ApplicationRecord
  has_secure_password

  has_many :todos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
  			format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
      		uniqueness: { case_sensitive: false }


  def self.authenticated(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password) 
  end

end
