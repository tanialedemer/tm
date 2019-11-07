class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.date :fecha
      t.references :proveedor, null: false, foreign_key: true
      t.references :tipo_factura, null: false, foreign_key: true
      t.integer :num_fact
      t.string :estado

      t.timestamps
    end
  end
end
