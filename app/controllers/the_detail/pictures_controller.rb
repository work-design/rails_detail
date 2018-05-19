class TheDetail::PicturesController < TheDetail::BaseController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = @pictures.page(params[:page])
  end

  def new
    @picture = Picture.new
    @picture.detail_type = params[:detail_type]
    @picture.detail_id = params[:detail_id]
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.detail_type = params[:detail_type]
    @picture.detail_id = params[:detail_id]

    respond_to do |format|
      if @picture.save
        format.html { redirect_to the_detail_pictures_url, notice: 'Picture was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to the_detail_pictures_url, notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to the_detail_pictures_url, notice: 'Picture was successfully destroyed.'
  end

  private
  def set_pictures
    @pictures = Picture.where(detail_type: params[:detail_type], detail_id: params[:detail_id])
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.fetch(:picture, {}).permit(
      :title,
      :file,
      :body
    )
  end

end