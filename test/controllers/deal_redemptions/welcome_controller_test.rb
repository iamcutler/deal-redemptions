require 'test_helper'

module DealRedemptions
  class WelcomeControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
