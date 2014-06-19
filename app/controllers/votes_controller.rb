class VotesController < ApplicationController

  def create
    vote = Vote.new(votes_params)
    vote.user_id = current_user.id
    if !vote.save
      flash[:notice] = "Could not count your vote."
    end
     redirect_to root_path
  end

  private

  def votes_params
    params.require(:vote).permit(:weighting, :achievement_id)
  end

end
