class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18nData.country_code(request.location.try(:country)).try(:downcase) if request.location.present?
  end

end
