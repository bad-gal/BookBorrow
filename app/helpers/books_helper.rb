# frozen_string_literal: true

module BooksHelper
  # owner_name(user)
  def owner_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
