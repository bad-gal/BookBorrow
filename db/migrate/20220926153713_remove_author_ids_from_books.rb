class RemoveAuthorIdsFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :author_ids
  end
end
