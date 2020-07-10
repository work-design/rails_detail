class Detail::My::MajorsController < Detail::My::BaseController
  before_action :set_major, only: [:pass, :update]
  before_action :set_knowledge

  def index
    @wikis = @knowledge.major_records.page(params[:page])
  end

  def new
    @wiki = @knowledge.major_records.build
  end

  def create
    @major = @knowledge.major_records.build
    @major.body = wiki_params[:body]
    @major.commit_message = wiki_params[:commit_message]
    @major.commit_id = current_user.id

    if @major.save
      render 'create'
    else
      render :new, locals: { model: @knowledge }, status: :unprocessable_entity
    end
  end

  def pass
    @wiki.status_passed!

    if @wiki == @knowledge.major_records.first
      @wiki.set_active
    end

    redirect_to knowledge_majors_url(@knowledge)
  end

  def destroy
    @wiki.destroy
  end

  private
  def set_major
    @wiki = MajorRecord.find params[:id]
  end

  def set_knowledge
    @knowledge = Knowledge.find params[:knowledge_id]
  end

  def wiki_params
    params[:wiki].permit(
      :body,
      :commit_message
    )
  end

end
