class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :pro_item, only: [:edit, :update, :destroy]
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def pro_item
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def set_order
    redirect_to root_path if @item.purchase_record.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
