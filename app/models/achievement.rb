class Achievement < ActiveRecord::Base
  validates :task, presence: true
end
