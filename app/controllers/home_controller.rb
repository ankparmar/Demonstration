class HomeController < ApplicationController
  skip_before_action :restrict_admin_access

  def index
  end
end
