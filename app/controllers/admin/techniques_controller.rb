class Admin::TechniquesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_permissions

  def index
  end

  private

    def check_admin_permissions
      redirect_to root_path unless current_user.is_admin?
    end
end