class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
  			format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
      		uniqueness: { case_sensitive: false }
end
