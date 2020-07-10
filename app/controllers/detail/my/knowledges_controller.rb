class Detail::My::KnowledgesController < Detail::My::BaseController
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]

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

  def new_belong
    if params[:type].present? && params[:id].present?
      @knowable = params[:type].safe_constantize.find(params[:id])
    end
  end

  def create_belong
    if params[:type].present? && params[:id].present?
      @knowable = params[:type].safe_constantize.find(params[:id])
      @knowable.update(knowledge_id: @knowledge)
    end
  end

  def show
    @knowledge = Knowledge.includes(:children => :content).find params[:id]
  end

  def child
    @knowledges = @knowledge.children
  end

  def edit
    @knowledge = Knowledge.includes(:children => :wiki).find params[:id]
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
      @sort = Sort.new(:position => @sup.position.to_i+1)
    else
      @parent = Sort.find params[:id]
      @sort = Sort.new(:position => params[:position])
    end
  end

  def create_sub
    @parent = Sort.find params[:id]
    @sort = @parent.children.new sort_params
    @sort.insert_at(params[:sort][:position].to_i)

    respond_to do |format|
      if @sort.save
        format.html { redirect_to :back, :notice => "添加成功" }
        format.json { render json: @sort, status: :created, location: @sort }
      else
        format.html { render :action => 'sub' }
        format.json { render json: @sort.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_knowledge
    @knowledge = Knowledge.find(params[:id])
  end

  def knowledge_params
    params.fetch(:knowledge, {}).permit(
      :title,
      :parent_id
    )
  end

end
