# frozen_string_literal: true

module BooksHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
