# class for product controller
class ProductController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_product, only: [:destroy]

  def index
    product = Product.all
    if product.present?
      render json: product, status: :ok
    else
      render json: {
        data: 'product not found'
      }, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    if product.present?
      render json: product, status: :ok
    else
      render json: {
        data: 'product not found'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @product
      @product.destroy!
      render json: {
        message: 'success deleted product'
      }, status: :ok
    else
      render json: {
        message: 'failed deleted product'
      }, status: :unprocessable_entity
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: {
        message: 'success inserted'
      }, status: :created
    else
      render json: {
        message: 'failed inserted'
      }, status: :unprocessable_entity
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
