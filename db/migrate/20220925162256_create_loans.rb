class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.date :loan_date
      t.date :return_by
      t.date :returned_on
      t.string :status

      t.timestamps
    end

    add_reference :loans, :user
    add_reference :loans, :book
  end
end
