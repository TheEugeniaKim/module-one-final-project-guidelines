class CreatePatronsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :patrons do |t|
      t.string :name
      t.string :birthdate
    end
  end
end
