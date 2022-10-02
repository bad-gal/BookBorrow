# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @featured = Book.featured
  end
end
