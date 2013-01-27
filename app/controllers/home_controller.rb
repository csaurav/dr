class HomeController < ApplicationController
  
  def index
  	@domains = Domain.includes(:tag).order(:url_name).page params[:page]
  	@domain = Domain.new
  end
  
end
