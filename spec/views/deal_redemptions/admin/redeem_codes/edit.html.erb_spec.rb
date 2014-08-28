require 'rails_helper'

RSpec.describe "admin/redeem_codes/edit", :type => :view do
  before(:each) do
    @admin_redeem_code = assign(:admin_redeem_code, Admin::RedeemCode.create!())
  end

  it "renders the edit admin_redeem_code form" do
    render

    assert_select "form[action=?][method=?]", admin_redeem_code_path(@admin_redeem_code), "post" do
    end
  end
end
