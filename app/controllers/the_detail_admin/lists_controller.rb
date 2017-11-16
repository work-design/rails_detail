class TheDetailAdmin::ListsController < TheDetailAdmin::BaseController
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = List.page(params[:page])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new list_params

    respond_to do |format|
      if @list.save
        format.html { redirect_to admin_lists_url notice: 'Item type was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @list.update list_params
        format.html { redirect_to admin_lists_url, notice: 'Item type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to admin_lists_url }
      format.json { head :no_content }
    end
  end

  private
  def set_list
    @list = List.find params[:id]
  end

  def list_params
    params.fetch(:list, {}).permit(:name, :kind)
  end

end
