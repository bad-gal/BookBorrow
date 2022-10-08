# frozen_string_literal: true

# Due to Rails 7 turbo component we need to make changes to how Devise displays
# flash messages. This workaround has been taken from
# https://betterprogramming.pub/devise-auth-setup-in-rails-7-44240aaed4be
# and is recommended by Devise
class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))

    rescue ActionView::MissingTemplate => error
      if get?
        raise_error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
