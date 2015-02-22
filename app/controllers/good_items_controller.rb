class Admin::GoodItemsController < Admin::BaseController
  before_action :set_good_item, only: [:show, :edit, :update, :destroy]
  before_action :set_good

  def index
    @good_items = @good.good_items
  end

  def show
  end

  def new
    @good_item = GoodItem.new
  end

  def edit
  end

  def create
    @good_item = GoodItem.new(good_item_params)

    respond_to do |format|
      if @good_item.save
        format.html { redirect_to good_good_items_url(@good), notice: 'Good item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @good_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @good_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @good_item.update(good_item_params)
        format.html { redirect_to good_good_items_url(@good), notice: 'Good item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @good_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @good_item.destroy
    respond_to do |format|
      format.html { redirect_to good_items_url }
      format.json { head :no_content }
    end
  end

  private
  def set_good
    @good = Good.find params[:good_id]
  end

  def set_good_item
    @good_item = GoodItem.find(params[:id])
  end

  def good_item_params
    params[:good_item].permit(:picture, :picture_cache)
  end
end
