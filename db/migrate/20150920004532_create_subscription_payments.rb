class CreateSubscriptionPayments < ActiveRecord::Migration
  def change
    create_table :subscription_payments do |t|
      t.integer :subscription_id

      t.timestamps null: false
    end
    add_index :subscription_payments, :subscription_id
  end
end
