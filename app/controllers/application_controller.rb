class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from ActiveRecord::RecordNotFound do |e|
    logger.error "Rescued from RecordNotFound \n" + e.message
    logger.debug e.backtrace.join("\n")
    if @api_mode
      head :status => 404
    else
      render "/errors/not_found", :status => 404, :layout => "application"
    end
  end

end
