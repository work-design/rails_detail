module Detail
  class Admin::ListsController < Admin::BaseController
    before_action :set_list, only: [:show, :edit, :update, :destroy, :actions]
    before_action :set_new_list, only: [:new, :create]

    def index
      q_params = {}
      q_params.merge! default_params

      @lists = List.default_where(q_params).page(params[:page])
    end

    private
    def set_list
      @list = List.find params[:id]
    end

    def set_new_list
      @list = List.new(list_params)
    end

    def list_params
      p = params.fetch(:list, {}).permit(
        :name,
        :kind
      )
      p.merge! default_form_params
    end

  end
end
