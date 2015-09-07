class SettingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user

  layout 'dashboard'

  def show
    render params[:id]
  end
end
