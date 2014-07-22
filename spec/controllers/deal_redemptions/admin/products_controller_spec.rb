require 'rails_helper'

module DealRedemptions
  RSpec.describe Admin::ProductsController, :type => :controller do
    routes { DealRedemptions::Engine::routes }

    # This should return the minimal set of attributes required to create a valid
    # Admin::Product. As you add validations to Admin::Product, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      FactoryGirl.attributes_for(:product)
    }

    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:product, name: '')
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # Admin::ProductsController. Be sure to keep this updated too.
    let(:valid_session) { { admin_user_id: 1 } }

    describe "GET index" do
      it "assigns all admin_products as @products" do
        product = DealRedemptions::Product.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:products)).to eq([product])
      end
    end

    describe "GET new" do
      it "assigns a new admin_product as @product" do
        get :new, {}, valid_session
        expect(assigns(:product)).to be_a_new(DealRedemptions::Product)
      end
    end

    describe "GET edit" do
      it "assigns the requested admin_product as @product" do
        product = DealRedemptions::Product.create! valid_attributes
        get :edit, {:id => product.to_param}, valid_session
        expect(assigns(:product)).to eq(product)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new DealRedemptions::Product" do
          expect {
            post :create, {:product => valid_attributes}, valid_session
          }.to change(DealRedemptions::Product, :count).by(1)
        end

        it "assigns a newly created admin_product as @product" do
          post :create, {:product => valid_attributes}, valid_session
          expect(assigns(:product)).to be_a(DealRedemptions::Product)
          expect(assigns(:product)).to be_persisted
        end

        it "redirects to the created admin_product" do
          post :create, {:product => valid_attributes}, valid_session
          expect(response).to redirect_to(admin_products_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved admin_product as @admin_product" do
          post :create, {:product => invalid_attributes}, valid_session
          expect(assigns(:product)).to be_a_new(DealRedemptions::Product)
        end

        it "re-renders the 'new' template" do
          post :create, {:product => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          FactoryGirl.attributes_for :product
        }

        it "updates the requested admin_product" do
          product = DealRedemptions::Product.create! valid_attributes
          put :update, {:id => product.to_param, :product => new_attributes}, valid_session
          product.reload
          expect(product.id).to eq(1)
        end

        it "assigns the requested admin_product as @product" do
          product = DealRedemptions::Product.create! valid_attributes
          put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
          expect(assigns(:product)).to eq(product)
        end

        it "redirects to the admin_product" do
          product = DealRedemptions::Product.create! valid_attributes
          put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
          expect(response).to redirect_to(admin_products_path)
        end
      end

      describe "with invalid params" do
        it "assigns the admin_product as @product" do
          product = DealRedemptions::Product.create! valid_attributes
          put :update, {:id => product.to_param, :product => invalid_attributes}, valid_session
          expect(assigns(:product)).to eq(product)
        end

        it "re-renders the 'edit' template" do
          product = DealRedemptions::Product.create! valid_attributes
          put :update, {:id => product.to_param, :product => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested admin_product" do
        product = DealRedemptions::Product.create! valid_attributes
        expect {
          delete :destroy, {:id => product.to_param}, valid_session
        }.to change(DealRedemptions::Product, :count).by(-1)
      end

      it "redirects to the admin_products list" do
        product = DealRedemptions::Product.create! valid_attributes
        delete :destroy, {:id => product.to_param}, valid_session
        expect(response).to redirect_to(admin_products_path)
      end
    end

  end
end
