class TheDetail::PicturesController < TheDetail::BaseController
  before_action :set_detail
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = @detail.pictures
  end

  def show
  end

  def new
    @picture = @detail.pictures.build
  end

  def edit
  end

  def create
    @picture = @detail.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
        format.js
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_detail
    @detail = Detail.find params[:detail_id]
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.fetch(:picture, {}).permit(:key, :title)
  end


end
