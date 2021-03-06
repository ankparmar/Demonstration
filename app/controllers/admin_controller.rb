class AdminController < ApplicationController
  skip_before_action :restrict_admin_access
  before_action :authorized?

  private

  def authorized?
    unless current_user.admin?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
