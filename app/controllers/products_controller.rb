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
    product = Product.new({title: params[:title], description: params[:description], brand: params[:brand], price: params[:price]})
    product.save 

    flash[:success] = "Recipe has been created!"

    redirect_to "/products/#{product.id}"
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

    flash[:success] = "You have edited the recipe"

    redirect_to "/products/#{product.id}"
    product.save 
  end 

  def destroy
     product = Product.find_by(id: params[:id])
     product.destroy 

     flash[:success] = "Recipe has been deleted!"

     redirect_to "/products"
  end 

end
