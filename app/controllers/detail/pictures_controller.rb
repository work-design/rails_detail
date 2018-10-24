class Detail::PicturesController < Detail::BaseController
  before_action :set_pictures, only: [:index]
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
        format.html { redirect_to detail_pictures_url(params[:detail_type], params[:detail_id]), notice: 'Picture was successfully created.' }
        format.js
        format.json { render json: { picture: @picture.as_json, filename: url_for(@picture.file) } }
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
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to detail_pictures_url(params[:detail_type], ), notice: 'Picture was successfully updated.' }
        format.json { render json: { filename: url_for(@picture.file) } }
      else
        format.html { render :edit }
        format.json { }
      end
    end
  end

  def destroy
    @picture.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to detail_pictures_url, notice: 'Picture was successfully destroyed.' }
    end
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
