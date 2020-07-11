class Detail::KnowledgesController < Detail::BaseController

  def index
    q_params = {}
    q_params.merge! params.permit('name-like')

    @knowledges = Knowledge.order(updated_at: :desc).page(params[:page])
  end

  def show
    @knowledge = Knowledge.includes(:contents, children: :contents).find params[:id]

    render layout: 'detail/show'
  end

  def child
    @knowledges = @knowledge.children
  end

  private
  def set_knowledge
    @knowledge = Knowledge.find(params[:id])
  end

end
