module Detail
  class My::MinorsController < My::BaseController
    before_action :set_minor, only: [:pass]
    before_action :set_knowledge

    def index
      @wikis = @knowledge.minor_records.page(params[:page])
    end

    def new
      @wiki = @knowledge.minor_records.build
    end

    def create
      @minor = @knowledge.minor_records.build
      @minor.body = wiki_params[:body]
      @minor.commit_message = wiki_params[:commit_message]
      @minor.commit_id = current_user.id

      if @minor.save
        render 'create'
      else
        render :new, locals: { model: @knowledge }, status: :unprocessable_entity
      end
    end

    def pass
      @wiki.status_passed!

      if @wiki == @knowledge.minor_records.first
        @wiki.set_active
      end

      redirect_to knowledge_minors_url(@knowledge)
    end

    def destroy
      @wiki.destroy
    end

    private
    def set_minor
      @wiki = MinorRecord.find params[:id]
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
end
