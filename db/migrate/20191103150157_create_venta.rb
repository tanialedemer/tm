class CreateVenta < ActiveRecord::Migration[6.0]
  def change
    create_table :venta do |t|
      t.references :tipo_factura, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.date :fecha
      t.references :orden_trabajo, null: false, foreign_key: true
      t.string :estado
      t.float :subtotal
      t.float :total
      t.float :saldo

      t.timestamps
    end
  end
end
