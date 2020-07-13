class RenameAdressToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :companies, :adress, :address
  end
end
