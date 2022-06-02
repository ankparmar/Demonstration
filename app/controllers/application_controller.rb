class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :restrict_admin_access

  private

  def restrict_admin_access
    if current_user.admin?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
