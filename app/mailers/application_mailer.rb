# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(ENV['EMAIL'], 'TODO-list')
  layout 'mailer'
end
