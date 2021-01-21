class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|

      t.string :title,          null: false
      t.string :client,         null: false
      t.integer :price,         null: false
      t.integer :client_status_id, null: false
      t.integer :sales_status_id,  null: false
      t.text    :memo
      t.text    :knowledge
      t.references :user,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
