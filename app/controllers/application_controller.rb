# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :devise_permit_params, if: :devise_controller?
  around_action :switch_locale

  private

  def devise_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def switch_locale(&action)
    locale = current_locale || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def current_locale
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s)
                         .include?(locale)
  end

  def default_url_options
    { locale: I18n.locale }    
  end
end
