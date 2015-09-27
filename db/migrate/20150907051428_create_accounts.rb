class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :accounts, :user_id
    add_index :accounts, :name, unique: true
  end
end
