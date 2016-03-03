class LibrinMailController < ApplicationController
  require 'resolv-replace'
  def suggestion
    sender = current_user.userName
    resource = Resource.find(params[:id])
    user = User.where(:userName => params[:userName]).first
       
    if user == nil
      @alert="EL USUARIO NO EXISTE"
      respond_to do |format|
        format.js 
        format.html{ 
        redirect_to file_url + "?id=#{params[:id]}", notice: @alert
        return
      }
      end
    else
    Librinmail.suggestion(sender, resource, user).deliver_now
    @alert="RECOMENDACIÓN ENVIADA"
          respond_to do |format|
      format.js 
      format.html{ 
        redirect_to file_url + "?id=#{params[:id]}", notice: @alert
        return
      }
    end
  end
 end
end
