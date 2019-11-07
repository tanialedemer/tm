class CreatePagoFacturas < ActiveRecord::Migration[6.0]
  def change
    create_table :pago_facturas do |t|
      t.references :compra, null: false, foreign_key: true
      t.references :proveedor, null: false, foreign_key: true
      t.date :fecha
      t.float :monto_pago

      t.timestamps
    end
  end
end
