class CreateBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :fiction_nonfiction
      t.string :genre
      t.integer :publication_year 
    end
  end
end
