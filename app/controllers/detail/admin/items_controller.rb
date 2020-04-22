class Detail::Admin::ItemsController < Detail::Admin::BaseController
  before_action :set_list
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @list.items.order(id: :asc).page(params[:page])
  end

  def search
    @items = Item.where(list_id: params[:list_id])
    results = @items.map { |x| { value: x.id, text: x.name, name: x.name } }

    render json: { values: results }
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build item_params

    if @item.save
      render :new, locals: { model: @item }, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.assign_attributes item_params

    unless @item.save
      render :edit, locals: { model: @item }, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private
  def set_list
    @list = List.find params[:list_id]
  end

  def set_item
    @item = Item.find params[:id]
  end

  def item_params
    params.fetch(:item, {}).permit(
      :name,
      :logo,
      :desc,
      :key
    )
  end

end
