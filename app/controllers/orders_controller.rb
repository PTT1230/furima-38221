class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Order.new
    @item = Item.find params[:item_id]
    if @item.shopping.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find params[:item_id]
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :municipalities, :address, :building, :phone_number, 
      :area_id, :shopping_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) #, :user_id, :item_id
    end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end