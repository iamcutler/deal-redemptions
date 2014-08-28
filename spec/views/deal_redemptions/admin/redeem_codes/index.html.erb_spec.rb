require 'rails_helper'

RSpec.describe "admin/redeem_codes/index", :type => :view do
  before(:each) do
    assign(:admin_redeem_codes, [
      Admin::RedeemCode.create!(),
      Admin::RedeemCode.create!()
    ])
  end

  it "renders a list of admin/redeem_codes" do
    render
  end
end
