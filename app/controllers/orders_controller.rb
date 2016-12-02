class OrdersController < ApplicationController

  def new 
  end 

  def create 
    @products = current_user.carted_products.where(status: "carted")
    if current_user != nil 

      order = Order.new(user_id: current_user.id)
      
      subtotal = 0.to_f

      current_user.carted_products.each do |carted_product|
        subtotal += (carted_product.product.price.to_f * carted_product.quantity.to_f) 
      end

      order.subtotal = subtotal 
      order.tax = order.subtotal * 0.09
      order.total = order.subtotal + order.tax 

      if order.save
        @products.each do |product|
          product.assign_attributes(status: "purchased", order_id: order.id)
          product.save 
        end

      # order[:order_id] = order.id
      flash[:success] = "Thank you for ordering!"
      redirect_to "/orders/#{order.id}"
    end 
  end 
    # else 
    #   flash[:warning] = "Your order is not complete"
    #   redirect_to "/products"
    # end 
  end 

  def show
  @order = Order.find_by(id: params[:id]) 
  end 


end


