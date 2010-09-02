class ProfilePage < Page

	description %{
		Tags to get info about a profile
		}

	tag "partner" do |tag|
		partner_id = $1 if request_uri =~ %r{^#{self.url}(\d{1,6})/?$}

		partner = Partner.find_by_id(partner_id)

		result = []
		
		tag.locals.page.title = partner.name

		tag.locals.data = partner

		result << tag.expand

		result
	end

	desc %{
		Output company fax 
	}
	tag "fax" do |tag|
		tag.locals.data.fax
	end

	desc %{
		Display company name
	}

	tag "company_name" do |tag|
		tag.locals.data.name
	end

	tag "address" do |tag|
		tag.locals.data.address + "<br />" + tag.locals.data.city + ", " + tag.locals.data.state + " " + tag.locals.data.zip
	end

	tag "cell" do |tag|
		tag.locals.data.cell
	end

	tag "business" do |tag|
		tag.locals.data.business
	end

	tag "website" do |tag|
		tag.locals.data.website
	end

	tag "description" do |tag|
		tag.locals.data.description
	end

	tag "contact_name" do |tag|
		tag.locals.data.first_name + " " + tag.locals.data.last_name
	end


	
	tag "album" do |tag|
		output = ''

		json = Net::HTTP.get(URI.parse("http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&photoset_id=#{tag.locals.data.flickr_id}+&api_key=6f977fc52e81b8f45764d91ab84999c2&format=json&nojsoncallback=1"))
		result = ActiveSupport::JSON.decode(json)
		unless result['stat'] == "fail"	
			set = result['photoset']['photo']
			
			total = 5
			unless set.empty?
				output += '<ul class="partner-photos">'
				set[0..total-1].each do |photo|
					thumb = "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_m.jpg"
					output += %{<li><img src="#{thumb}" alt="#{photo['title']}" /></li>}
				end
				output += "</ul>"
			end
		end

		output
	
	end
end
