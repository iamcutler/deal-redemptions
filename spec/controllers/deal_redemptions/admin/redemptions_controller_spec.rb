require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::RedemptionsController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    # This should return the minimal set of attributes required to create a valid
    # Admin::Redemption. As you add validations to Admin::Redemption, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      FactoryGirl.attributes_for(:redemption)
    }

    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:redemption, company_id: '')
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # Admin::RedemptionsController. Be sure to keep this updated too.
    let(:valid_session) {
      {admin_user_id: 1}
    }

    before(:each) do
      @user = FactoryGirl.create(:user)

      @redemptions = [
        FactoryGirl.create(:redemption),
        FactoryGirl.create(:redemption_2),
        FactoryGirl.create(:redemption_3)
      ]

      # Set protected and private methods as public for testing
      DealRedemptions::Admin::RedemptionsController.send(:public, *DealRedemptions::Admin::RedemptionsController.protected_instance_methods)
      DealRedemptions::Admin::RedemptionsController.send(:public, *DealRedemptions::Admin::RedemptionsController.private_instance_methods)
    end

    describe "GET #index" do
      context 'with no search parameter' do
        before :each do
          get :index, {}, valid_session
        end

        it "assigns all redemptions to @redemptions" do
          expect(assigns(:redemptions)).to_not be_nil
        end
      end

      context 'with search parameter' do
        before :each do
          get :index, { search: 'John Doe' }, valid_session
        end

        it "assigns searched redemptions to @redemptions" do
          expect(assigns(:redemptions)).to_not be_nil
        end
      end
    end

    describe "GET #show" do
      before(:each) do
        get :show, {:id => @redemptions[0].id}, valid_session
      end

      it "assigns the requested redemption as @redemption" do
        expect(assigns(:redemption)).to be_a DealRedemptions::Redemption
      end
    end

    describe 'building search query' do
      before :each do
        get :index, { search: 'John Doe' }, valid_session
      end

      it 'should return sql query as a string' do
        expect(controller.send(:build_search_query)).to_not be_nil
      end
    end
  end
end
