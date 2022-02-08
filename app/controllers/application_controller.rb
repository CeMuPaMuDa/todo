# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :devise_permit_params, if: :devise_controller?
  around_action :switch_locale

  private

  def devise_permit_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    loc = params[:locale]

    return loc if I18n.available_locales.map(&:to_s).include?(loc)

    nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
