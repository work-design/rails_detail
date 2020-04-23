class Detail::Admin::TaxonItemsController < Detail::Admin::BaseController
  before_action :set_taxon_item, only: [:show, :edit, :update, :destroy]

  def index
    taxon_items = TaxonItem.includes(:list).where(taxon_type: params[:taxon_type], taxon_id: params[:taxon_id])
    @items_hash = taxon_items.group_by { |i| i.list }
  end

  def new
    @taxon = params[:taxon_type].safe_constantize.find params[:taxon_id]
    if params[:list_id]
      @list = List.find params[:list_id]
    else
      @lists = List.all.map { |list| [list.name, list.id] }
    end

    @taxon_item = TaxonItem.new(taxon_type: params[:taxon_type], taxon_id: params[:taxon_id], list_id: params[:list_id])
  end

  def create
    @taxon_item = TaxonItem.new(taxon_item_params)

    unless @taxon_item.save
      render :new, locals: { model: @taxon_item }, status: :unprocessable_entity
    end
  end

  def new_item
    @items = Item.where(list_id: taxon_item_params[:list_id])
  end

  def new_list
    x_params = params.permit(:taxon_type, :taxon_id, :list_id)
    @taxon_item = TaxonItem.new(x_params)

    item_ids = TaxonItem.where(x_params).pluck(:item_id)
    @items = Item.where(list_id: params[:list_id]).where.not(id: item_ids).pluck(:name, :id)
  end

  def show
  end

  def edit
  end

  def update
    @taxon_item.update(taxon_item_params)

    unless @taxon_item.save
      render :edit, locals: { model: @taxon_item }, status: :unprocessable_entity
    end
  end

  def destroy
    @taxon_item.destroy
  end

  private
  def set_taxon_item
    @taxon_item = TaxonItem.find(params[:id])
  end

  def taxon_item_params
    params.fetch(:taxon_item, {}).permit(
      :list_id,
      :item_id
    ).merge(
      taxon_type: params[:taxon_type],
      taxon_id: params[:taxon_id]
    )
  end

end
