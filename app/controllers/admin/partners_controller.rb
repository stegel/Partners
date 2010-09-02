class Admin::PartnersController < ApplicationController

	def index
		@partners = Partner.find(:all)
	end

  def new
    @partner = Partner.new
  end
  
	def edit 
		@partner = Partner.find_by_id(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    
    respond_to do |format|
      if @partner.save!
        format.html { redirect_to(admin_partner_url(@partner), :notice => "Partner was successfully created.")}
        format.xml {render :xml => @partner, :status => :created, :location => @partner}
      else
        format.html { render :action => "new" }
        format.xml 
      end
    end
  end
  
  def update
    @partner = Partner.find(params[:id])
     
    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        format.html { redirect_to(admin_partner_url(@partner), :notice => "Partner was successfully updated.")}
        format.xml { head :ok}
      end
     end
  end
  
  def show
    @partner = Partner.find_by_id(params[:id])
  end
end
