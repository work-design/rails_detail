class TheDetail::PicturesController < TheDetail::BaseController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.page(params[:page])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to the_detail_pictures_url, notice: 'Picture was successfully created.'
    else
      render :new
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
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def the_detail_picture_params
    params.fetch(:picture, {}).permit(
    )
  end

end