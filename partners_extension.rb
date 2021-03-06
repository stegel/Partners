# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PartnersExtension < Radiant::Extension
  version "1.1"
  description "Display partner information as a list and individual profiles"
  url "http://yourwebsite.com/partners"
 
  define_routes do |map|
    
    map.namespace :admin do |admin|
      admin.resources :partners
    end

    map.resources :partners
	
  end
  
  def activate
	tab "Manage Site" do
		add_item('Partners','/admin/partners')
	end
	PartnerPage
	ProfilePage
  end
  
  def deactivate
    # admin.tabs.remove "Partners"
  end
  
end
