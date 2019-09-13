class AddCheckoutToLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :status, :string, :default => "checked out" 
  end
end



