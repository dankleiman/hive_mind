class AchievementsController < ApplicationController
  before_filter :authorize

  def index
    @achievements = Achievement.all
    binding.pry
    @vote = Vote.new
    @top_achievements = Achievement.top_achievements
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
    if @achievement.save
      flash[:notice] = "Successfully added."
    else
      flash[:notice] = "Could not save your achievement."
    end
    redirect_to achievements_path
  end

  private

  def achievement_params
    params.require(:achievement).permit(:task)
  end
end
