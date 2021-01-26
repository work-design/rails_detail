module Detail
  class Admin::ListsController < Admin::BaseController
    before_action :set_list, only: [:edit, :update, :destroy]

    def index
      q_params = {}
      q_params.merge! default_params

      @lists = List.default_where(q_params).page(params[:page])
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new list_params

      unless @list.save
        render :new, locals: { model: @list }, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      @list.assign_attributes list_params

      unless @list.save
        render :edit, locals: { model: @list }, status: :unprocessable_entity
      end
    end

    def destroy
      @list.destroy
    end

    private
    def set_list
      @list = List.find params[:id]
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
