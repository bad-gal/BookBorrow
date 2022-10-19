# frozen_string_literal: true

module AuthorsHelper
  # author_name(author)
  def author_name(author)
    "#{author.first_name} #{author.last_name}"
  end

  def author_list(authors)
    authors.map do |author|
      author_name(author).to_s
    end.to_sentence
  end
end
