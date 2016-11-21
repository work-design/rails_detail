class Site::PagesController < Site::BaseController
  before_action :set_page, only: [:edit, :update, :destroy]

  def index
    @pages = current_site.pages.page(params[:page])
  end

  def new
    @page = current_site.pages.build
    #@page_parts = filter_parts.map { |page_part| @page.page_part(page_part) }
  end

  def create
    @page = current_site.pages.build(page_params)
    if @page.save
      redirect_to edit_site_page_url(@page)
    else
      render :new
    end
  end

  def edit
  end

  def update
    result = @page.update(page_params)
    respond_to do |format|
      if result
        format.html { redirect_to edit_site_page_url(@page) }
        format.js
      else
        format.html do
          @page_parts = @page.page_parts
          render :edit
        end
      end
    end
  end

  def sort
    params[:list].each_pair do |parent_pos, parent_node|
      if parent_node[:children].present?
        parent_node[:children].each_pair do |child_pos, child_node|
          child_node[:children].each_pair { |grand_child_pos, grand_child| update_page_position(grand_child, grand_child_pos, child_node[:id]) } if child_node[:children].present?
          update_page_position(child_node, child_pos, parent_node[:id])
        end
      end
      update_page_position(parent_node, parent_pos, nil)
    end
    render nothing: true
  end

  def destroy
    @page.destroy
    redirect_to site_pages_url, notice: 'Page was successfully destroyed.'
  end

  private
  def set_page
    @page = Page.find(params[:id])
  end

  def update_page_position(page, position, parent_id = nil)
    Page.update(page[:id], position: position.to_i + 1, parent_id: parent_id )
  end

  def page_params
    params.require(:page).permit!
  end

end
