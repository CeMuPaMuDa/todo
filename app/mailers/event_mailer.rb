# frozen_string_literal: true

class EventMailer < ApplicationMailer
  def user_deadlines(user, events)
    @events = events
    # attachments['event.png'] = File.read(Rails.root.join('public/Mail.png'))
    mail(
      to: user.email,
      subject: I18n.t('emails.subjects.user_deadlines')
    )
  end
end
