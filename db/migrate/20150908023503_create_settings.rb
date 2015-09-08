class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :collapse_menu, default: false
      t.boolean :fixed_sidebar, default: false
      t.boolean :top_navbar, default: false
      t.boolean :boxed_layout, default: false
      t.boolean :fixed_footer, default: false
      t.integer :account_id, null: false

      t.timestamps null: false
    end
  end
end
