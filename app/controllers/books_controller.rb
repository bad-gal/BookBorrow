# frozen_string_literal: true

class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @books = Book.available
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def show
    @book = Book.find(params[:id])
  end

  def destroy; end

  private

  def book_params
    params.require(:book).permit(:title, :description, :publish_date, :return_by, :returned_on, :user_id, :category_id)
  end

  def record_not_found
    flash[:alert] = I18n.t('errors.book_not_found')
    redirect_to books_path
  end
end
