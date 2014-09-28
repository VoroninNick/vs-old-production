# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  layout 'main'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  add_crumb "::Головна", "/"
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :set_locale

private

  def record_not_found
    render :template => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
  end

  def set_locale
    I18n.locale = :ua
  end

end
