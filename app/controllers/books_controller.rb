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
      # if book_cover is empty then add book_placeholder image
      unless @book.book_cover.attached?
        @book.book_cover.attach(
          io: Rails.root.join('app/assets/images/book_placeholder.gif').open,
          filename: 'book_placeholder', content_type: 'image/gif'
        )
      end

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
    @is_available = Book.available.include?(@book)
  end

  def destroy; end

  private

  def book_params
    params.require(:book)
          .permit(:title,
                  :description,
                  :publish_year,
                  :return_by,
                  :returned_on,
                  :user_id,
                  :category_id,
                  :book_cover,
                  authors_attributes: %i[id first_name last_name _destroy])
  end

  def record_not_found
    flash[:alert] = I18n.t('errors.book_not_found')
    redirect_to books_path
  end
end
