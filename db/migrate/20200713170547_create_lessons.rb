class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name, null:false
      t.datetime :time, null:false
      t.string :note
      t.integer :price

      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
