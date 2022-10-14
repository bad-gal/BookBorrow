class ChangeBookPublishDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :publish_date
    add_column :books, :publish_year, :integer
  end
end
