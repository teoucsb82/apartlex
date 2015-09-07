class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user
  
  def home

  end
end
