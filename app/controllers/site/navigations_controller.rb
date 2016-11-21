class Site::NavigationsController < Site::BaseController
  before_action :set_navigation, only: [:show, :edit, :update, :move_higher, :move_lower, :destroy]
  before_action :set_pages, only: [:new, :edit]

  def index
    @navigations = current_site.navigations
  end

  def show
  end

  def new
    @navigation = current_site.navigations.build
  end

  def edit
  end

  def create
    @navigation = current_site.navigations.build(navigation_params)
    if @navigation.save
      redirect_to site_navigations_url, notice: 'Nav was successfully created.'
    else
      render :new
    end
  end

  def update
    if @navigation.update(navigation_params)
      redirect_to site_navigations_url, notice: 'Nav was successfully updated.'
    else
      render :edit
    end
  end

  def move_higher
    @navigation.move_higher
    redirect_to site_navigations_url
  end

  def move_lower
    @navigation.move_lower
    redirect_to site_navigations_url
  end

  def destroy
    @navigation.destroy
    redirect_to site_navigations_url, notice: 'Nav was successfully destroyed.'
  end

  private
  def set_navigation
    @navigation = Navigation.find(params[:id])
  end

  def set_pages
    @pages = Page.all
  end

  def navigation_params
    result = params[:navigation].permit(:title, :parent_id, :page_id, :position)
    result.reject! { |_, value| value.blank? }
    result
  end

end
