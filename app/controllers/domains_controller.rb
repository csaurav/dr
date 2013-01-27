class DomainsController < ApplicationController
	def new
		@domain = Domain.new
	end

	def create
		if params[:domain]
			file = params[:domain][:file]
			@domain = Domain.new
			if @domain.start_file_processing file
				flash[:success] = "Imported successfully"
				redirect_to root_url
			else
				render :new
			end
		else
			flash[:error] = "Could not import! Please try again."
			render :new
		end
	end

	def assign_tag
		begin
			@domain = Domain.find_by_id (params[:id])	
			@domain.create_tag params[:status]
			flash[:success] = "Record updated successfully!"
			redirect_to root_url
		rescue ActiveRecord::RecordNotFound
			redirect_to evaluation_responses_path
			flash[:error] = "Record could not be updated!."
			redirect_to root_url
		end
	end
end
