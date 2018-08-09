class ProductController < ApplicationController
    skip_before_action :verify_authenticity_token  
    before_action :find_product, only: [:show, :destroy]

    def index
        products = Product.all
        render json: products.blank? ? { data: "product not found"} : products, status: :ok    
    end

    def show
        render json: @product.blank? ? { data: "product not found"} : @product, status: :ok
    end

    def destroy
        if @product
            @product.destroy!
            render json: {message: "success deleted product"} , status: :ok            
        else
            render json: {message: "failed deleted product"} , status: :unprocessable_entity
        end
    end

    def create
        product = Product.new(product_params)
        if product.save
          render json: { message: "success inserted" }, status: :created
        else
          render json: { message: "failed inserted" }, status: :unprocessable_entity
        end
    end

    private

    def find_product
        @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description)
    end
  
end
