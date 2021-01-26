module Detail
  class My::KnowledgesController < My::BaseController
    before_action :set_knowledge, only: [:show, :edit, :update, :toggle_knowable, :destroy]

    def index
      q_params = {}
      q_params.merge! params.permit('name-like')

      @knowledges = Knowledge.roots.page(params[:page])
    end

    def new
      @knowledge = Knowledge.new(parent_id: params[:parent_id])
    end

    def create
      @knowledge = Knowledge.new(knowledge_params)

      if @knowledge.save
        if @knowledge.parent
          return_to = knowledge_url(@knowledge.parent)
        else
          return_to = knowledges_url
        end
        render 'create', locals: { return_to: return_to }
      else
        render :new, locals: { model: @knowledge }, status: :unprocessable_entity
      end
    end

    def new_knowable
      q_params = {}
      q_params.merge! params.permit(:knowable_type, :knowable_id)

      @select_ids = Knowing.where(knowable_type: params[:knowable_type], knowable_id: params[:knowable_id]).pluck(:knowledge_id)
      @knowledges = Knowledge.where(id: @select_ids)
    end

    def toggle_knowable
      q_params = {}
      q_params.merge! params.permit(:knowable_type, :knowable_id)

      @knowing = @knowledge.knowings.find_or_initialize_by(q_params)

      if @knowing.persisted?
        @knowing.destroy
      else
        @knowing.save
      end
    end

    def search
      q_params = {}
      q_params.merge! params.permit('title-like')

      @select_ids = Knowing.where(knowable_type: params[:knowable_type], knowable_id: params[:knowable_id]).pluck(:knowledge_id)
      @knowledges = Knowledge.default_where(q_params).limit(5)
    end

    def show
      @knowledge = Knowledge.includes(:children => :content).find params[:id]
    end

    def edit
      @knowledge = Knowledge.find params[:id]
    end

    def update
      @knowledge.assign_attributes knowledge_params

      if @knowledge.save
        render 'update'
      else
        render :edit, locals: { model: @knowledge }, status: :unprocessable_entity
      end
    end

    def destroy
      @knowledge.destroy
    end

    def sub
      if params[:sup]
        @sup = Sort.find params[:sup]
        @sort = Sort.new(position: @sup.position.to_i+1)
      else
        @parent = Sort.find params[:id]
        @sort = Sort.new(position: params[:position])
      end
    end

    def create_sub
      @parent = Sort.find params[:id]
      @sort = @parent.children.new sort_params
      @sort.insert_at(params[:sort][:position].to_i)


      if @sort.save

      else
        render :sub, locals: { model: @knowledge }, status: :unprocessable_entity
      end
    end

    private
    def set_knowledge
      @knowledge = Knowledge.find(params[:id])
    end

    def knowledge_params
      params.fetch(:knowledge, {}).permit(
        :title,
        :body,
        :parent_id
      )
    end

  end
end
