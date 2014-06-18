class Achievement < ActiveRecord::Base
  validates :task, presence: true
  has_many :votes

end
