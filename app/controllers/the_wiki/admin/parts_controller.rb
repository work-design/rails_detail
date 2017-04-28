class Admin::PartsController < Admin::BaseController
  before_action :set_wiki, :only => [:new, :create]

  def index
    @sort = Sort.find params[:sort_id]
    @parts = @sort.parts.order("id DESC")

    respond_to do |format|
      format.html
      format.json { render json: @parts }
    end
  end

  def new
    @part = Part.new
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @part }
    end
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

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @part }
    end
  end

  def destroy
    @sort = Sort.find params[:sort_id]
    @part = Part.find(params[:id])
    @part.destroy

    respond_to do |format|
      format.html { redirect_to parts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_wiki
    @solo = Solo.find params[:wiki_id]
  end

  def part_params
    params.require(:part).permit(:content, :reason).merge(:user_id => current_user.id)
  end


end
