class DeleteAvailableColumnLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :available
  end
end
