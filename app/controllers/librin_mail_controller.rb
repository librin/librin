class LibrinMailController < ApplicationController
  require 'resolv-replace'
  def suggestion
    sender = current_user.userName
    resource = Resource.find(params[:id])
    user = User.where(:userName => params[:userName]).first
    
    if user == nil
      redirect_to file_url + "?id=#{params[:id]}", notice: "El usuario no existe"
      return
    else
    Librinmail.suggestion(sender, resource, user).deliver_now
    end
    redirect_to file_url + "?id=#{params[:id]}", notice: "Recomendación enviada"
  end
end
