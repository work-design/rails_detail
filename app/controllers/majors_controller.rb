class ManjorsController < ApplicationController
  before_action :set_major, only: [:edit, :update]
  before_action :set_knowledge

  def index
    @majors = @knowledge.majors.order("id DESC")

    respond_to do |format|
      format.html
      format.json { render json: @majors }
    end
  end

  def new
    if @knowledge.majors == []
      @major = major.new
    else
      @major = major.new(:content => @knowledge.majors.last.content||'',
                       :picture => @knowledge.majors.last.picture)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @major = @knowledge.majors.build major_params

    respond_to do |format|
      if @major.save
        format.html { redirect_to @major, notice: 'major was successfully created.' }
        format.js
        format.json { render json: @major, status: :created, location: @major }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @major }
    end
  end

  def edit
    respond_to do |format|
      format.js
      format.html { render :layout => false }
    end
  end

  def update
    respond_to do |format|
      if @knowledge.update(knowledge_params)
        format.html { redirect_to :back, :notice => '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @knowledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @major.destroy

    respond_to do |format|
      format.html { redirect_to majors_url }
      format.json { head :no_content }
    end
  end

  private
  def set_major
    @major = Major.find params[:id]
  end

  def set_knowledge
    @knowledge = Knowledge.find params[:knowledge_id]
  end

  def major_params
    params[:major].permit(:name, :subname, :content, :reason).merge(:user_id => current_user.id)
  end

end
