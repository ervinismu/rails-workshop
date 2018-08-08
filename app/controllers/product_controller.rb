class ProductController < ApplicationController
    
    def index
        products = Product.all
        render json: products.blank? ? { data: "product not found"} : products, status: :ok    
    end

    def show
        product = Product.find_by(id: params[:id])
        render json: product.blank? ? { data: "product not found"} : product, status: :ok
    end

    def delete
    
    end

    def edit
    
    end

end
