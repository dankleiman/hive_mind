class Achievement < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :task, presence: true

  def self.top_achievements
    @top_achievements = Achievement.connection.select_all("select a.task, sum(v.weighting) from votes v inner join achievements a on v.achievement_id = a.id group by a.task order by sum(v.weighting) desc limit 5")
  end

  def self.unvoted_achievements(current_user_id)
    @unvoted_achievements = Achievement.connection.select_all("select a.task from achievements a inner join votes v on v.achievement_id = a.id where v.user_id != #{current_user_id} group by a.task")
  end

end
