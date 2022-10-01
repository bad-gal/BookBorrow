# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.available
    @featured = Book.featured
  end
end
