class Admin::KnowledgesController < Admin::BaseController
  before_action :set_knowledge, only: [:show, :child, :edit, :update, :destroy]

  def index
    @knowledges = Knowledge.roots.page(params[:page])
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
  end

  def child
    @knowledges = @knowledge.children

    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    if @knowledge.update(knowledge_params)
      redirect_to admin_knowledges_url, notice: 'Knowledge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @knowledge.destroy
    redirect_to admin_knowledges_url, notice: 'Knowledge was successfully destroyed.'
  end

  private
  def set_knowledge
    @knowledge = Knowledge.find(params[:id])
  end

  def knowledge_params
    params[:knowledge].permit(:name, :parent_id)
  end

end
