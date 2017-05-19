class TheDetail::GoodItemsController < TheDetail::BaseController
  before_action :set_detail_item, only: [:show, :edit, :update, :destroy]
  before_action :set_detail

  def index
    @detail_items = @detail.detail_items
  end

  def show
  end

  def new
    @detail_item = GoodItem.new
  end

  def edit
  end

  def create
    @detail_item = GoodItem.new(detail_item_params)

    respond_to do |format|
      if @detail_item.save
        format.html { redirect_to detail_detail_items_url(@detail), notice: 'Good item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @detail_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @detail_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @detail_item.update(detail_item_params)
        format.html { redirect_to detail_detail_items_url(@detail), notice: 'Good item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @detail_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @detail_item.destroy
    respond_to do |format|
      format.html { redirect_to detail_items_url }
      format.json { head :no_content }
    end
  end

  private
  def set_detail
    @detail = Good.find params[:detail_id]
  end

  def set_detail_item
    @detail_item = GoodItem.find(params[:id])
  end

  def detail_item_params
    params[:detail_item].permit(:picture, :picture_cache)
  end
end
