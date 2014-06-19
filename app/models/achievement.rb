class Achievement < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  validates :task, presence: true

  def self.top_achievements
    @top_achievements = Achievement.connection.select_all("select a.task, sum(v.weighting) from votes v inner join achievements a on v.achievement_id = a.id group by a.task order by sum(v.weighting) desc limit 5")
  end

  def self.voted_on_achievements(user)
    joins(:votes).where(votes: {user: user}).group("achievements.id")
  end


end
