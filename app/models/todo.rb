class Todo < ApplicationRecord
  belongs_to :user#, optional: true

  validates :description, presence: true

  def days_left
  	7 - (DateTime.now.to_date - self.created_at.to_date).to_i
  end  

end
