# frozen_string_literal: true

class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @books = Book.available
  end

  def new
    @book = Book.new
    @book.authors.build
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      flash[:notice] = t('book.create.success')
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit; end

  def update; end

  def show
    @book = Book.find(params[:id])
  end

  def destroy; end

  private

  def book_params
    params.require(:book)
          .permit(:title,
                  :description,
                  :publish_date,
                  :return_by,
                  :returned_on,
                  :user_id,
                  :category_id,
                  authors_attributes: %i[id first_name last_name _destroy])
  end

  def record_not_found
    flash[:alert] = I18n.t('errors.book_not_found')
    redirect_to books_path
  end
end
