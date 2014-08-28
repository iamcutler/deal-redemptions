require 'rails_helper'

RSpec.describe "admin/redeem_codes/show", :type => :view do
  before(:each) do
    @admin_redeem_code = assign(:admin_redeem_code, Admin::RedeemCode.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
