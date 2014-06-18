class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
    @vote = Vote.new
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      @vote = Vote.create(count: 0, user_id: current_user.id, achievement_id: @achievement.id)
      @achievement.user_id = current_user.id
      binding.pry
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
