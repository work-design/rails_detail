class SitemapsController < ApplicationController

  def show
    @pages = Page.live.sorted
  end

end

