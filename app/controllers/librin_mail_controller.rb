class LibrinMailController < ApplicationController
  require 'resolv-replace'
  def suggestion
    sender = current_user.userName
    resource = Resource.find(params[:id])
    user = User.where(:userName => params[:userName]).first
    Librinmail.suggestion(sender, resource, user).deliver_now
  end
end
