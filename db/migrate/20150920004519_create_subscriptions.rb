class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :account, index: true
      t.string :type_of
      t.boolean :active, default: false
      t.date :start_date, default: Date.today
      t.date :end_date

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :accounts
  end
end
