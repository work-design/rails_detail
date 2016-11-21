class Site::BaseController < ApplicationController
  layout 'site'
  helper_method :current_site,
                :current_account

  def current_site
    current_user.site
  end

  def new_messages
    @new_messages = Inquiry.new_messages.sorted
  end

  def current_account
    @current_account ||= current_site
  end

end
