class VoteController < ApplicationController
  def create
	vote = Vote.new
	vote.value = params[:value]
	vote.resource=Resource.find params[:id]
	vote.user=current_user
	vote.save
	redirect_to :back
  end

  def update
  end

  def delete
  end
end
