class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :account_id

      t.timestamps null: false
    end
    add_index :properties, :account_id
  end
end
