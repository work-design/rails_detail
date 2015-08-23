class KnowledgesController < ApplicationController

  def search
    @knowledges = Knowledge.where('name like ?', "%#{params[:q]}%")
    
    respond_to do |format|
      format.json
    end
  end

  def show
    @knowledge = Knowledge.includes(:children => :wiki).find params[:id]
  end

  def edit
    @knowledge = Knowledge.includes(:children => :wiki).find params[:id]
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

  def fade_form
  end



end
