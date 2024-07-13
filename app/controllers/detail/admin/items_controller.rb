module Detail
  class Admin::ItemsController < Admin::BaseController
    before_action :set_list
    before_action :set_item, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_item, only: [:new, :create]

    def index
      @items = @list.items.order(id: :asc).page(params[:page])
    end

    private
    def set_list
      @list = List.find params[:list_id]
    end

    def set_item
      @item = @list.items.find params[:id]
    end

    def set_new_item
      @item = @list.items.build item_params
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
end
