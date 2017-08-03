class Api::V1::Admin::BaseController < Api::ApplicationController
  before_action :check_admin!

  def check_admin!
    unless current_user.admin?
      render json: { error: "Not Permissions" }, status: 403
    end
  end


end
