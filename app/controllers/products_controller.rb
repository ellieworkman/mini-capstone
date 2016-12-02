class ProductsController < ApplicationController
  before_action :authenticate_user!

  def home
    @page_title = "Ellie's Favorite Beauty Products"
    @products = Product.all 
  end

  def index 

    if params[:category] 
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
    end

    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    end

    if params[:discount_price]
      @products = Product.where("#{params[:discount_price]} < ?", 25)
    end

  end

  def new
    if current_user 
    else 
      flash[:warning] = "Please login"
      redirect_to "/login"
    end
  end 

  def create
    @product = Product.new({title: params[:title], description: params[:description], brand: params[:brand], price: params[:price], supplier_id: params[:supplier][:supplier_id], user_id: current_user.id})
    @product.save 

    flash[:success] = "Product has been created!"

    redirect_to "/products/#{@product.id}"
  end 

  def show 
    @product = Product.find_by(id: params[:id]) 

    if params[:id] == "random"
      @product = Product.all.sample 
    end
  end 

  def edit 
    @product = Product.find_by(id: params[:id])
  end 

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(({title: params[:title], description: params[:description], brand: params[:brand], price: params[:price]}))

    flash[:success] = "You have edited the product"

    redirect_to "/products/#{product.id}"
    product.save 
  end 

  def destroy
     product = Product.find_by(id: params[:id])
     product.destroy 

     flash[:danger] = "Product has been deleted!"

     redirect_to "/products"
  end 

end
