# frozen_string_literal: true

class ProfilesController < ApplicationController
  def index
    @books_owned = Book.owned(current_user.id)
    @current_borrowed_books = Loan.outstanding(current_user.id)
    @borrowed_books_history = Loan.history(current_user.id)
  end
end
