class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:list_id].present?
      @items = set_list.items
    else
      @items = Item.page(params[:page])
    end

  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build item_params

    respond_to do |format|
      if @item.save
        format.html { redirect_to admin_list_items_url(params[:list_id]), :notice => '商品描述创建成功' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit
    @list = @item.list
  end

  def update

    respond_to do |format|
      if @item.update item_params
        format.html { redirect_to admin_list_items_url(@item.list_id), notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_url(@item.list_id) }
      format.json { head :no_content }
    end
  end

  private
  def set_item
    @item = Item.find params[:id]
  end

  def set_list
    @list = List.find params[:list_id]
  end

  def item_params
    params[:item].permit(:parent_id,
                         :name,
                         :content,
                         :photo,
                         :photo_cache)
  end

end
