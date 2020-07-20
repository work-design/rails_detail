class Detail::KnowledgesController < Detail::BaseController

  def index
    q_params = {}
    q_params.merge! params.permit('title-like')

    @knowledges = Knowledge.order(id: :desc).page(params[:page])
  end

  def search
    q_params = {}
    q_params.merge! params.permit('title-like')

    @knowledges = Knowledge.default_where(q_params).limit(5)
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
