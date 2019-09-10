class CreateLoansTable < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :patron_id
      t.integer :book_id
      t.datetime :timestamps
    end
  end
end
