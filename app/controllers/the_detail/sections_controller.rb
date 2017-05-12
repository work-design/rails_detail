class SectionsController < ApplicationController

  def index
    @sort = Sort.find(params[:sort_id])
    @sections = Section.find_all_by_sort_id(params[:sort_id])
  end

  def new
    @section = Section.new
    @sort = Sort.find(params[:sort_id])
  end

  def create
    @section = Section.new(params[:section])
    @section.sort_id = params[:sort_id]

    @baike = Sort.find(params[:sort_id])
    @baike.have_section = 1
    @baike.save


    respond_to do |format|
      if @section.save
        format.html { redirect_to sort_sections_url(params[:sort_id]), :notice => '添加成功' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @section = Section.find(params[:id])
    @sort = Sort.find @section.sort_id
  end

  def update
    @section = Section.find(params[:id])
    @sort = Sort.find @section.sort_id

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to sort_sections_url(@sort), notice: "修改成功" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @sort = Sort.find @section.sort_id
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sort_sections_url(@sort) }
      format.json { head :no_content }
    end
  end

end
