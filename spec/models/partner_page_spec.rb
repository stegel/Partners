require File.dirname(__FILE__) + '/../spec_helper'

describe PartnerPage do
  before(:each) do
    @partner_page = PartnerPage.new
  end

  it "should be valid" do
    @partner_page.should be_valid
  end
end
