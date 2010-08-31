class PartnerPage < Page
	description %{
		A partner page list all partners and links to their respective profiles
	}

	def child_url(child)
		clean_url "#{ url }/"
	end

	def find_by_url(url, live = true, clean = false)
		url = clean_url(url) if clean
		if url =~ %r{^#{ self.url }(\d{1,6})/?$}
			children.find_by_class_name('ProfilePage')
		else
			super
		end
	end

	tag "partners" do |tag|
		type = tag.attr['type']
		partners = Partner.find(:all, :conditions => "partner_type = #{type}" )
		result = []
		partners.each do |partner|
			tag.locals.data = partner
			result << tag.expand
		end
		result
	end

	tag "link" do |tag|
		"<a href='#{self.url}#{tag.locals.data.id}'>#{tag.locals.data.name}</a>"
	end

	tag "description" do |tag|
		tag.locals.data.description
	end

end
