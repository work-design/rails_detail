class Site::SitesController < Site::BaseController
  before_action :set_site, only: [:show, :edit, :update, :current, :destroy]

  def index
    @sites = current_user.sites

    if @sites.blank?
      @sites << current_user.sites.create(current: true, name: 'default site')
    end
  end

  def show
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = current_user.sites.build(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to site_sites_url, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to site_sites_url, notice: 'Site was successfully updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def current
    @site.set_current
    redirect_to site_sites_url
  end

  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to site_sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params[:site].permit!
  end

end
