# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @featured = Book.featured(5)
  end
end
