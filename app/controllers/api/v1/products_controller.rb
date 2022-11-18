class Api::V1::ProductsController < ApplicationController
  before_action :doorkeeper_authorize!
  def index
    @products = Product.page(params[:page] || 1).per(params[:per] || 2)
    render json: @products, status: 200
  end

  def show
    @product = Product.find(params[:id])
    if @product
      render json: @product, status: 200
    else
      render json: {error: "products not found."}
    end
  end

  def create
    @product = Product.new(name: params[:name],
    brand: params[:brand],
    price: params[:price],
    description: params[:description])
    if @product.save
      render json: @product, status: 200
    else
      render json: {error: "product not created"}
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(name: params[:name],
    brand: params[:brand],
    price: params[:price],
    description: params[:description]
    )
    render json: @product, status: 200
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: Product.all 
  end
  private
    def prod_params
      params.require(:product).permit([:name,:brand,:price,:description])
    end
end