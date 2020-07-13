class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null:false
      t.string :city, null:false
      t.string :address, null:false
      t.string :vatcode

      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
