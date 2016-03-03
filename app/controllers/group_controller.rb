class GroupController < ApplicationController
  before_action :authenticate_user!
    group = current_user.group
    group.update_attributes(getParams)
  def update

  end

  def getParams
      params.require(:group).permit(:description)
  end
end
