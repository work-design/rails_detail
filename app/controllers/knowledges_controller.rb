class KnowledgesController < ApplicationController

  def show
    @knowledge = Knowledge.includes(:children => :wiki).find params[:id]
  end

  def fade_form
  end

end
