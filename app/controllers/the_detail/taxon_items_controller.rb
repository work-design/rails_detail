class TheDetail::TaxonItemsController < TheDetail::BaseController
  before_action :set_taxon, only: [:index, :new, :create]
  before_action :set_taxon_item, only: [:show, :edit, :update, :destroy]

  def index
    @taxon_items = @taxon.taxon_items.page(params[:page])
  end

  def show
  end

  def new
    @lists = List.all.map { |list| [list.name, list.id] }
    @taxon_item = @taxon.taxon_items.build
  end

  def edit
  end

  def create
    @taxon_item = @taxon.taxon_items.build(taxon_item_params)

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
  def set_taxon
    @taxon = Taxon.find params[:taxon_id]
  end

  def set_taxon_item
    @taxon_item = TaxonItem.find(params[:id])
  end

  def taxon_item_params
    params.fetch(:taxon_item, {}).permit(:list_id, :item_id, :value)
  end

end
