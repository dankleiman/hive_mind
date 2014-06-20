class VotesController < ApplicationController

  def create
    if Vote.already_counted?(current_user, params[:vote][:achievement_id])
      vote = Vote.new(votes_params)
      vote.user_id = current_user.id
      if vote.save
        flash[:notice] = "Your vote has been recorded!"
      else
        flash[:alert] = "Could not count your vote."
      end
    else
      flash[:alert] = "You already voted for this."
    end
    redirect_to achievements_path
  end

  private

  def votes_params
    params.require(:vote).permit(:weighting, :achievement_id)
  end

end
