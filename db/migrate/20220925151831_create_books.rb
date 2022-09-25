class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.date :publish_date
      t.bigint 'author_ids', array: true
      t.timestamps
    end

    add_reference :books, :user
    add_reference :books, :category
  end
end
