class OrdersController < ApplicationController
  #before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
    @item = Item.find params[:item_id]
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find params[:item_id]
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :municipalities, :address, :building, :phone_number, :area_id, :shopping_id, :user_id, :item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:order).permit(:post_code, :municipalities,:address,:building, :phone_number, :area.id, :user.id, :order.id).merge(order_id: @order.id)
  end
end