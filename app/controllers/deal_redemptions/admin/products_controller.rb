require_dependency "deal_redemptions/application_controller"

module DealRedemptions
  class Admin::ProductsController < ApplicationController
    layout '/deal_redemptions/admin/default'

    before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

    # GET /admin/products
    def index
      @products = Product.page(params[:page])
    end

    # GET /admin/products/new
    def new
      @product = Product.new
    end

    # GET /admin/products/1/edit
    def edit
    end

    # POST /admin/products
    def create
      @product = Product.new(admin_product_params)

      if @product.save
        redirect_to admin_products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/products/1
    def update
      if @product.update(admin_product_params)
        redirect_to admin_products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/products/1
    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def admin_product_params
        params.require(:product).permit(:name, :url)
      end
  end
end
