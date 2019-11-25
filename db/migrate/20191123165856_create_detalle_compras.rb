class CreateDetalleCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :detalle_compras do |t|
      t.references :repuesto_servicio, null: false, foreign_key: true
      t.float :cantidad
      t.float :precio_unitario
      t.float :precio_venta
      t.float :subtotal
      t.references :compra, null: false, foreign_key: true

      t.timestamps
    end
  end
end
