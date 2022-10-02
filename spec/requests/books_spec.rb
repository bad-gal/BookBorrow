# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
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
end
