class Admin::PartnersController < ApplicationController

	def index
		@partners = Partner.find(:all)
	end

	def edit 
		@partner = Partner.find_by_id(params[:id])
	end 
end
