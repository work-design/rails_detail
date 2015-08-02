class MajorsController < ApplicationController
  before_action :set_major, only: [:edit, :update]
  before_action :set_knowledge


  def index
    @wikis = @knowledge.major_records.page(params[:page])
  end


  def new
    @wiki = @knowledge.major_records.build

    respond_to do |format|
      format.js
    end
  end

  def create
    @wiki = @knowledge.major_records.build
    @wiki.body = wiki_params[:body]
    @wiki.commit_message = wiki_params[:commit_message]
    @wiki.commit_id = current_user.id

    respond_to do |format|
      if @wiki.save
        format.js
      else
        format.js
      end
    end
  end

  def pass
    @wiki.status_passed!

    if @wiki == @knowledge.major_records.last
      @wiki.set_active
    end

    redirect_to knowledge_majors_url(@knowledge)
  end

  def destroy
    @wiki.destroy

    respond_to do |format|
      format.html { redirect_to admin_sorts_url }
      format.json { head :no_content }
    end
  end


  private

  def set_wiki
    @wiki = majorRecord.find params[:id]
  end

  def set_knowledge
    @knowledge = Knowledge.find params[:knowledge_id]
  end

  def wiki_params
    params[:wiki].permit(:body, :commit_message)
  end

end
