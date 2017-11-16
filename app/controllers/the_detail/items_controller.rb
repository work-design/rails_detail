class TheDetail::ItemsController < TheDetail::BaseController

  def search
    @items = Item.where(list_id: params[:list_id])
    results = @items.map { |x| { value: x.id, text: x.name, name: x.name } }

    render json: { values: results }
  end

end
