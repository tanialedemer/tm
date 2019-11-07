class CreateDetalleOrdenTrabajos < ActiveRecord::Migration[6.0]
  def change
    create_table :detalle_orden_trabajos do |t|
      t.references :orden_trabajo, null: false, foreign_key: true
      t.references :repuesto_servicio, null: false, foreign_key: true
      t.float :cantidad
      t.float :precio_venta
      t.float :subtotal
      t.float :total

      t.timestamps
    end
  end
end
