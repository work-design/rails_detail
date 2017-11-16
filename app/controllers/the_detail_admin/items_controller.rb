class TheDetailAdmin::ItemsController < TheDetailAdmin::BaseController
  before_action :set_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @list.items.page(params[:page])
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build item_params

    respond_to do |format|
      if @item.save
        @item.logo.attach(logo_params) if logo_params.present?
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
    @item.logo.attach(logo_params) if logo_params.present?

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
      format.html { redirect_to admin_list_items_url(@item.list_id) }
      format.json { head :no_content }
    end
  end

  private
  def set_list
    @list = List.find params[:list_id]
  end

  def set_item
    @item = Item.find params[:id]
  end

  def item_params
    params[:item].permit(:name, :logo, :desc, :key)
  end

  def logo_params
    params.fetch(:item, {}).permit(:logo).fetch(:logo, {})
  end

end
