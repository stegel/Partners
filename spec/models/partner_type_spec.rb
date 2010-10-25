require File.dirname(__FILE__) + '/../spec_helper'

describe PartnerType do
  before(:each) do
    @partner_type = PartnerType.new
  end

  it "should be valid" do
    @partner_type.should be_valid
  end
end
