class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    render json: "home"
  end
end