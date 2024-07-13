module Detail
  class My::SourcesController < My::BaseController

    def index
      @sources = Source.page(params[:page])
    end

    private
    def set_source
      @source = Source.find(params[:id])
    end

    def set_new_source
      @source = Source.new source_params
    end

    def source_params
      params.fetch(:source, {}).permit()
    end

  end
end
