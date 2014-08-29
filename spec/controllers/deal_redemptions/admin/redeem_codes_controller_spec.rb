require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::RedeemCodesController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    # This should return the minimal set of attributes required to create a valid
    # Admin::RedeemCode. As you add validations to Admin::RedeemCode, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      FactoryGirl.attributes_for(:redeem_code)
    }

    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:redeem_code, code: '')
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # Admin::RedeemCodesController. Be sure to keep this updated too.
    let(:valid_session) {
      {admin_user_id: 1}
    }

    before :each do
      FactoryGirl.create(:user, id: 1)

      # Mock call to check for existing redemption code on create or update
      allow(DealRedemptions::RedeemCode).to receive(:find_code_by_company).and_return(false)
    end

    describe "GET index" do
      it "assigns all admin_redeem_codes as @admin_redeem_codes" do
        redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:admin_redeem_codes)).to eq([redeem_code])
      end
    end

    describe "GET new" do
      it "assigns a new admin_redeem_code as @admin_redeem_code" do
        get :new, {}, valid_session
        expect(assigns(:admin_redeem_code)).to be_a_new(DealRedemptions::RedeemCode)
      end
    end

    describe "GET edit" do
      it "assigns the requested admin_redeem_code as @admin_redeem_code" do
        redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
        get :edit, {:id => redeem_code.to_param}, valid_session
        expect(assigns(:admin_redeem_code)).to eq(redeem_code)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Admin::RedeemCode" do
          expect {
            post :create, {:redeem_code => valid_attributes}, valid_session
          }.to change(DealRedemptions::RedeemCode, :count).by(1)
        end

        it "assigns a newly created admin_redeem_code as @admin_redeem_code" do
          post :create, {:redeem_code => valid_attributes}, valid_session
          expect(assigns(:admin_redeem_code)).to be_a(DealRedemptions::RedeemCode)
          expect(assigns(:admin_redeem_code)).to be_persisted
        end

        it "redirects to the admin_redeem_codes" do
          post :create, {:redeem_code => valid_attributes}, valid_session
          expect(response).to redirect_to(admin_redeem_codes_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved admin_redeem_code as @admin_redeem_code" do
          post :create, {:redeem_code => invalid_attributes}, valid_session
          expect(assigns(:admin_redeem_code)).to be_a_new(DealRedemptions::RedeemCode)
        end

        it "re-renders the 'new' template" do
          post :create, {:redeem_code => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          { redeem_code: FactoryGirl.attributes_for(:redeem_code) }
        }

        it "updates the requested admin_redeem_code" do
          redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
          put :update, {:id => redeem_code.to_param, :redeem_code => new_attributes}, valid_session
          redeem_code.reload
          expect(redeem_code.id).to eq(1)
        end

        it "assigns the requested admin_redeem_code as @admin_redeem_code" do
          redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
          put :update, {:id => redeem_code.to_param, :redeem_code => valid_attributes}, valid_session
          expect(assigns(:admin_redeem_code)).to eq(redeem_code)
        end

        it "redirects to the admin_redeem_codes" do
          redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
          put :update, {:id => redeem_code.to_param, :redeem_code => valid_attributes}, valid_session
          expect(response).to redirect_to(admin_redeem_codes_path)
        end
      end

      describe "with invalid params" do
        it "assigns the admin_redeem_code as @admin_redeem_code" do
          redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
          put :update, {:id => redeem_code.to_param, :redeem_code => invalid_attributes}, valid_session
          expect(assigns(:admin_redeem_code)).to eq(redeem_code)
        end

        it "re-renders the 'edit' template" do
          redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
          put :update, {:id => redeem_code.to_param, :redeem_code => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested admin_redeem_code" do
        redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
        expect {
          delete :destroy, {:id => redeem_code.to_param}, valid_session
        }.to change(DealRedemptions::RedeemCode, :count).by(-1)
      end

      it "redirects to the admin_redeem_codes list" do
        redeem_code = DealRedemptions::RedeemCode.create! valid_attributes
        delete :destroy, {:id => redeem_code.to_param}, valid_session
        expect(response).to redirect_to(admin_redeem_codes_url)
      end
    end

  end
end
