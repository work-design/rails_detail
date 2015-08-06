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

    if @knowledge.save
      redirect_to admin_knowledges_url, notice: 'Knowledge was successfully created.'
    else
      render :new
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
