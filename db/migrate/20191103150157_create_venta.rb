class CreateVenta < ActiveRecord::Migration[6.0]
  def change
    create_table :venta do |t|
      t.references :cliente, null: false, foreign_key: true
      t.date :fecha
      t.references :orden_trabajo, null: false, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
