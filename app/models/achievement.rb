class Achievement < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :task, presence: true

end
