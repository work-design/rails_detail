module Detail
  class Admin::EntityItemsController < Admin::BaseController
    before_action :set_entity
    before_action :set_entity_item, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_entity_item, only: [:new, :create]

    def index
      @items_hash = @entity.items
      @entity_items = EntityItem.includes(:taxon_item).where(entity_type: params[:entity_type], entity_id: params[:entity_id]).page(params[:page])
    end

    def new
      @entity_item = @entity.entity_items.find_or_initialize_by(taxon_item_id: params[:taxon_item_id])
    end

    def create
      @entity_item = @entity.entity_items.find_or_initialize_by(taxon_item_id: entity_item_params[:taxon_item_id])
      @entity_item.value = entity_item_params[:value]

      if @entity_item.save
        @entity_item.taxon_item.entity_item_id = @entity_item.id
      end
    end

    private
    def set_entity
      @entity = params[:entity_type].safe_constantize&.find_by(id: params[:entity_id])
    end

    def set_entity_item
      @entity_item = EntityItem.find(params[:id])
    end

    def entity_item_params
      params.fetch(:entity_item, {}).permit(
        :taxon_item_id,
        :value
      )
    end

  end
end
