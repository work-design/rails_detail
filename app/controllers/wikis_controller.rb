class TheDetail::WikisController < TheDetail::BaseController

  def index
    @themes = Solo.roots
  end

  def search
    @sorts = Sort.find [params[:id],1]
    #if params[:ids]
    #  @sorts = Sort.where(:id => params[:ids].split('-'))
    #else
    #  @sorts = Sort.limit(20).search(:name_cont => params[:q]).result
    #end
  end

  def show
    @solo = Wiki.includes(:children).find params[:id]
  end

  def fade_form
  end

end
