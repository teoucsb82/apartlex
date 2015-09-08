class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :property_id
      t.string :unit
      t.integer :square_footage
      t.float :rent
      t.text :description

      t.timestamps null: false
    end
    add_index :apartments, :property_id
  end
end
