require 'rails_helper'

RSpec.describe "admin/redeem_codes/new", :type => :view do
  before(:each) do
    assign(:admin_redeem_code, Admin::RedeemCode.new())
  end

  it "renders new admin_redeem_code form" do
    render

    assert_select "form[action=?][method=?]", admin_redeem_codes_path, "post" do
    end
  end
end
