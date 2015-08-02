class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  before_action :set_knowledge
  
  def index
    @wikis = @knowledge.wiki_histories.page(params[:page])
  end

  def new
    @wiki = @knowledge.wiki_histories.build

    respond_to do |format|
      format.js
    end
  end

  def create
    @wiki = @knowledge.wiki_histories.build
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
    
  def edit    
    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if @sort.update(sort_params)
        format.html { redirect_to :back, :notice => '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sort.errors, status: :unprocessable_entity }
      end
    end
  end

  def sub
    if params[:sup]
      @sup = Sort.find params[:sup]
      @sort = Sort.new(:position => @sup.position.to_i+1)
    else
      @parent = Sort.find params[:id]
      @sort = Sort.new(:position => params[:position])
    end
  end

  def create_sub
    @parent = Sort.find params[:id]
    @sort = @parent.children.new sort_params
    @sort.insert_at(params[:sort][:position].to_i)

    respond_to do |format|
      if @sort.save
        format.html { redirect_to :back, :notice => "添加成功" }
        format.json { render json: @sort, status: :created, location: @sort }
      else
        format.html { render :action => 'sub' }
        format.json { render json: @sort.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sort.destroy

    respond_to do |format|
      format.html { redirect_to admin_sorts_url }
      format.json { head :no_content }
    end
  end
 
  private
  def set_wiki
    @wiki = Wiki.find params[:id]
  end

  def set_knowledge
    @knowledge = Knowledge.find params[:knowledge_id]
  end

  def wiki_params
    params[:wiki].permit(:body, :commit_message)
  end

end
