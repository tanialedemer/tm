class CreateGastos < ActiveRecord::Migration[6.0]
  def change
    create_table :gastos do |t|
      t.date :fecha_compra
      t.string :motivo
      t.string :descripcion
      t.float :costo

      t.timestamps
    end
  end
end
