class Admin::KnowledgesController < Admin::BaseController
  before_action :set_knowledge, only: [:show, :edit, :update, :destroy]

  def index
    @knowledges = Knowledge.page(params[:page])
  end

  def show
  end

  def new
    @knowledge = Knowledge.new
  end

  def edit
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)

    if @knowledge.save
      redirect_to admin_knowledges_url, notice: 'Knowledge was successfully created.'
    else
      render :new
    end
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
    params[:knowledge].permit(:name)
  end

end
