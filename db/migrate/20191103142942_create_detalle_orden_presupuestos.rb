class CreateDetalleOrdenPresupuestos < ActiveRecord::Migration[6.0]
  def change
    create_table :detalle_orden_presupuestos do |t|
      t.references :presupuesto, null: false, foreign_key: true
      t.references :repuesto_servicio, null: false, foreign_key: true
      t.float :cantidad
      t.float :precio_unitario
      t.float :subtotal
      t.float :total

      t.timestamps
    end
  end
end
