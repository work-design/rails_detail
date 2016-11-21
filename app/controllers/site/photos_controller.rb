class Site::PhotosController < Site::BaseController
  layout 'site/media_library'
  before_action :set_breadcrumbs

  def index
    add_breadcrumb I18n.t('spina.website.photos'), site_photos_path
    @photos = Photo.sorted
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to spina.site_photos_url
  end

  def enhance
    @photo = Photo.find(params[:id])
    @photo.remote_file_url = params[:new_image]
    @photo.save
  end

  def link
    @photo = Photo.find(params[:id])
  end

  def photo_select
    @photos = Photo.sorted
    @photo = Photo.new
    @selected_photo = Photo.find(params[:selected_photo_id]) if params[:selected_photo_id]
  end

  def photo_collection_select
    @photos = Photo.sorted
    @photo = Photo.new
    @selected_photos = params[:selected_photo_ids] ? Photo.where(id: params[:selected_photo_ids]) : Photo.none
  end

  def insert_photo
    @photo = Photo.find(params[:photo_id]) if params[:photo_id].present?
  end

  def insert_photo_collection
    @photos = Photo.find(params[:photo_ids]) if params[:photo_ids].present?
  end

  def wysihtml5_insert
    @photo = Photo.find(params[:photo_id])
  end

  def wysihtml5_select
    @photos = Photo.sorted
    @photo = Photo.new
  end

  private

  def set_breadcrumbs
    add_breadcrumb I18n.t('spina.website.media_library'), site_media_library_path
  end

  def photo_params
    params.require(:photo).permit(:file)
  end

end