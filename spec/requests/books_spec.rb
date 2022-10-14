# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe 'GET /index' do
    it 'returns http success' do
      get books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    context 'when book exists' do
      it 'returns http success' do
        book = create(:book)

        get book_path(book.id)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when book non-existent' do
      it 'renders index page' do
        get book_path(383_980)
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET /new' do
    it 'renders the new Book form' do
      sign_in user
      get new_book_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    it "creates a Book and redirects to the Book's page" do
      sign_in user

      params = { book: { title: 'My Book',
                         description: 'Book Description',
                         publish_year: 2019,
                         category_id: category.id,
                         user_id: 1,
                         author_id: 2 } }

      post books_path, params: params
      expect(response).to redirect_to(assigns(:book))

      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include I18n.t('book.create.success')
    end

    it 'fails to create a Book and returns to the new page' do
      sign_in user

      params = { book: { title: 'My Book',
                         description: 'Book Description',
                         author_id: 2 } }

      post books_path, params: params
      expect(response).to render_template 'new'
    end
  end
end
