# frozen_string_literal: true

module AuthorsHelper
  # full_name(author.first_name, author.last_name)
  def full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end
end
