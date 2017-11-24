class TheDetail::TaxonItemsController < TheDetail::BaseController
  before_action :set_taxon_item, only: [:show, :edit, :update, :destroy]

  def index
    taxon_items = TaxonItem.includes(:list).where(taxon_type: params[:taxon_type], taxon_id: params[:taxon_id])
    @items_hash = taxon_items.group_by { |i| i.list }
  end

  def show
  end

  def new
    @lists = List.all.map { |list| [list.name, list.id] }
    @taxon_item = TaxonItem.new(taxon_type: params[:taxon_type], taxon_id: params[:taxon_id])
  end

  def edit
  end

  def create
    @taxon_item = TaxonItem.new(taxon_item_params)

    respond_to do |format|
      if @taxon_item.save
        format.js
        format.html { redirect_to @taxon_item, notice: 'Taxon item was successfully created.' }
      else
        format.js
        format.html { render :new }
      end
    end

  end

  def update
    respond_to do |format|
      if @taxon_item.update(taxon_item_params)
        format.js
        format.html { redirect_to @taxon_item, notice: 'Taxon item was successfully created.' }
      else
        format.js
        format.html { render :edit }
      end
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
    params.fetch(:taxon_item, {}).permit(:list_id, :item_id).merge(taxon_type: params[:taxon_type], taxon_id: params[:taxon_id])
  end

end
