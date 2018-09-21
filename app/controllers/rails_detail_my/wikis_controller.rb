class RailsDetailMy::WikisController < RailsDetailMy::BaseController


  def search
    @sorts = Sort.find [params[:id],1]
    #if params[:ids]
    #  @sorts = Sort.where(:id => params[:ids].split('-'))
    #else
    #  @sorts = Sort.limit(20).search(:name_cont => params[:q]).result
    #end
  end


  def index
    @sorts = Sort.roots
  end

  def new
    @sort = Sort.new
  end

  def create
    @sort = Sort.new sort_params

    respond_to do |format|
      if @sort.save
        format.html { redirect_to admin_sorts_url, notice: '添加成功' }
      else
        format.html { render action: "new" }
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

  def wiki_params
    params[:wiki].permit(:name, :subname, :position)
  end


  def show
    @solo = Wiki.includes(:children).find params[:id]
  end

  def fade_form
  end

end
