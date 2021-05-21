class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
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

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
