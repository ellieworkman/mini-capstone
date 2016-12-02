class CartedProductsController < ApplicationController

  def create 
    if current_user != nil 

      @product = Product.find_by(id: params[:product_id])
      carted_product = CartedProduct.new(user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id], status: "carted")

      # order.subtotal = @product.price * @order.quantity
      # order.tax = @order.subtotal * 0.09
      # order.total = @order.subtotal + @order.tax 

      carted_product.save
      # order[:order_id] = order.id
      flash[:success] = "Thank you for ordering!"
      redirect_to "/carted_products"
    end 
  end

  def index 
    @carted_products = current_user.carted_products.where(status: "carted") 
  end

  def destroy
      product = CartedProduct.find_by(id: params[:carted_product_id])
      product.assign_attributes(status: "removed")
      product.save

      flash[:warning] = "You removed it"
      redirect_to "/carted_products"
  end
end
