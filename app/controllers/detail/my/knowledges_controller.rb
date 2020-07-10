class Detail::My::KnowledgesController < Detail::My::BaseController

  def index
    @knowledges = Knowledge.roots.page(params[:page])
  end

  def search
    @knowledges = Knowledge.where('name like ?', "%#{params[:q]}%")
  end

  def new
    parent_id = params[:parent_id] || 0
    @knowledge = Knowledge.new(parent_id: parent_id)
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)
    @parent = Knowledge.find_by(id: knowledge_params[:parent_id])

    if @knowledge.save
      if knowledge_params[:parent_id] == 0
        redirect_to admin_knowledges_url, notice: 'Knowledge was successfully created.'
      else
        redirect_to admin_knowledge_url(@parent.parent), notice: 'Knowledge was successfully created.'
      end
    else
      render :new
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
    if @knowledge.update(knowledge_params)
    else
      render :edit
    end
  end

  def destroy
    @knowledge.destroy
    redirect_to admin_knowledges_url, notice: 'Knowledge was successfully destroyed.'
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
    params[:knowledge].permit(:name, :parent_id)
  end

end
