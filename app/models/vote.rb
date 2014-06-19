class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement

  def self.already_counted?(current_user, achievement_id)
    where(user: current_user, achievement_id: achievement_id).empty?
  end
end
