class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement

  def self.voted_on?(achievement_id, user_id)
    binding.pry
    Vote.where(achievement_id: achievement_id, user_id: user_id).empty?
  end
end
