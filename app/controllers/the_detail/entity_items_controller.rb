class TheDetail::EntityItemsController < TheDetail::BaseController
  before_action :set_entity_item, only: [:show, :edit, :update, :destroy]

  def index
    @entity_items = EntityItem.where(entity_type: params[:entity_type], entity_id: params[:entity_id]).page(params[:page])
  end

  def show
  end

  def new
    @lists = List.all.map { |list| [list.name, list.id] }
    @entity_item = @entity.entity_items.build
  end

  def edit
  end

  def create
    @entity_item = @entity.entity_items.build(entity_item_params)

    respond_to do |format|
      if @entity_item.save
        format.js
        format.html { redirect_to @entity_item, notice: 'Taxon item was successfully created.' }
      else
        format.js
        format.html { render :new }
      end
    end

  end

  def update
    respond_to do |format|
      if @entity_item.update(entity_item_params)
        format.js
        format.html { redirect_to @entity_item, notice: 'Taxon item was successfully created.' }
      else
        format.js
        format.html { render :edit }
      end
    end
  end

  def destroy
    @entity_item.destroy
  end

  private
  def set_entity_item
    @entity_item = EntityItem.find(params[:id])
  end

  def entity_item_params
    params.fetch(:entity_item, {}).permit(:list_id, :item_id, :value)
  end

end
