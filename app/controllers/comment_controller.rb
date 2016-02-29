class CommentController < ApplicationController

	def create
		resource = Resource.find params[:id].to_i
		comment = resource.comments.create(comment: params[:comment])
		current_user.comments << comment
  		redirect_to(controller: 'resource', action: 'file', id: params[:id])
	end

end
