class AddUniquenessToBookAuthors < ActiveRecord::Migration[7.0]
  def change
    remove_index :book_authors, :author_id
    add_index :book_authors, :author_id, unique: true
  end
end
