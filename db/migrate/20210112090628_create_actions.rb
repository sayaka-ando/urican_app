class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :title,          null: false
      t.string :client,         null: false
      t.integer :price,         null: false
      t.integer :client_status, null: false
      t.integer :sales_status,  null: false
      t.text    :memo,          null: false
      t.text    :knowledge,     null: false
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
