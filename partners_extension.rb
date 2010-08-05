# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PartnersExtension < Radiant::Extension
  version "1.1"
  description "Display partner information as a list and individual profiles"
  url "http://yourwebsite.com/partners"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :partners
  #   end
  # end
  
  def activate
    # admin.tabs.add "Partners", "/admin/partners", :after => "Layouts", :visibility => [:all]
	PartnerPage
  end
  
  def deactivate
    # admin.tabs.remove "Partners"
  end
  
end
