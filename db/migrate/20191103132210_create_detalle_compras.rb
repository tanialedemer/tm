class CreateDetalleCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :detalle_compras do |t|
      t.references :compra, null: false, foreign_key: true
      t.references :repuesto_servicio, null: false, foreign_key: true
      t.float :cantidad
      t.float :subtotal
      t.float :iva
      t.float :precio_unitario
      t.float :precio_venta
      t.float :total
      t.float :pago
      t.float :saldo

      t.timestamps
    end
  end
end
