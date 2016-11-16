class ProductsController < ApplicationController
  def home
    @page_title = "Ellie's Favorite Beauty Products"
    @products = Product.all 
  end

  def index 
    @products = Product.all
  end

  def new
  end 

  def create
    products = Product.new({title: params[:title], description: params[:description], brand: params[:brand], price: params[:price]})
    products.save 
  end 

  def show 
    @product = Product.find_by(id: params[:id]) 
  end 

  def edit 
    @product = Product.find_by(id: params[:id])
  end 

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(({title: params[:title], description: params[:description], brand: params[:brand], price: params[:price]}))
    product.save 
  end 

  def destroy
     product = Product.find_by(id: params[:id])
     product.destroy 
  end 

end
