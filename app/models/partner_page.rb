class PartnerPage < Page
	description %{
		A partner page list all partners and links to their respective profiles
	}

	def child_url(child)
	end

	tag "partners" do |tag|
		partners = Partner.find(:all)
		result = []
		partners.each do |partner|
			tag.locals.data = partner
			result << tag.expand
		end
		result
	end

	desc %{
		Output company fax 
	}
	tag "fax" do |tag|
		tag.locals.data.fax
	end

	tag "title" do |tag|
		page = tag.locals.page
		page.title
	end

end
