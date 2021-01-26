module Detail
  class My::SourcesController < My::BaseController

    def index
      @sources = Source.all
    end

    def show
      @source = Source.find(params[:id])
    end

    def new
      @source = Source.new
    end

    def edit
      @source = Source.find(params[:id])
    end

    def create
      @source = Source.new(params[:source])

      respond_to do |format|
        if @source.save
          format.html { redirect_to @source, notice: 'Source was successfully created.' }
          format.json { render json: @source, status: :created, location: @source }
        else
          format.html { render action: "new" }
          format.json { render json: @source.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @source = Source.find(params[:id])

      respond_to do |format|
        if @source.update_attributes(params[:source])
          format.html { redirect_to @source, notice: 'Source was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @source.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @source.destroy
    end

    private
    def set_source
      @source = Source.find(params[:id])
    end

  end
end
