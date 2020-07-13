class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :postcode, null: false
      t.string :vatcode, null: false

      t.timestamps
    end
  end
end
