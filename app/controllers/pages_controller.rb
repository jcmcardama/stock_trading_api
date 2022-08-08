class PagesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  
  def home
  end
end
