class Detail::My::PartsController < Detail::My::BaseController
  before_action :set_wiki, only: [:new, :create]

  def index
    @sort = Sort.find params[:sort_id]
    @parts = @sort.parts.order(id: :desc)
  end

  def new
    @part = Part.new
  end

  def create
    @sort = Sort.find params[:sort_id]
    @part = @sort.parts.build part_params


    respond_to do |format|
      if @part.save
        format.html { redirect_to sort_parts_path(sort), :notice => '添加成功!' }
        format.js
        format.json { render json: @part, status: :created, location: @part }
      else
        format.html { render action: "new" }
        format.js { render :status => 406 }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @sort = Sort.find params[:sort_id]
    @part = Part.find(params[:id])
  end

  def destroy
    @sort = Sort.find params[:sort_id]
    @part = Part.find(params[:id])
    @part.destroy
  end

  private
  def set_wiki
    @solo = Solo.find params[:wiki_id]
  end

  def part_params
    params.fetch(:part, {}).permit(
      :content,
      :reason
    ).merge(
      user_id: current_user.id
    )
  end


end
