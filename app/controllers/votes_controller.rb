class VotesController < ApplicationController

  def create
    if Vote.where(user_id: current_user.id, achievement_id: params[:vote][:achievement_id]).empty?
      vote = Vote.new(votes_params)
      vote.user_id = current_user.id
      if !vote.save
        flash[:notice] = "Could not count your vote."
      end
    else
      flash[:notice] = "You already voted for this."
    end
    redirect_to achievements_path
  end

  private

  def votes_params
    params.require(:vote).permit(:weighting, :achievement_id)
  end

end
