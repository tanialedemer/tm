class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.date :fecha
      t.references :proveedor, null: false, foreign_key: true
      t.integer :num_fact
      t.float :total

      t.timestamps
    end
  end
end
