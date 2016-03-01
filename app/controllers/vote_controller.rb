class VoteController < ApplicationController
  def create
    voted=current_user.votes.where(:resource_id => params[:id])
	if voted.empty?
	  vote = Vote.new
	  vote.value = params[:rating]
	  vote.resource=Resource.find params[:id]
	  vote.user=current_user
	  vote.save
	end
    redirect_to :back
  end
end
