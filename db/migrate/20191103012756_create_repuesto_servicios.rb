class CreateRepuestoServicios < ActiveRecord::Migration[6.0]
  def change
    create_table :repuesto_servicios do |t|
      t.string :codigo
      t.text :descripcion
      t.float :stock, null: false
      t.float :costo
      t.float :precio_venta
      t.string :categoria

      t.timestamps
    end
  end
end
