class CreatePresupuestos < ActiveRecord::Migration[6.0]
  def change
    create_table :presupuestos do |t|
      t.text :descripcion
      t.references :cliente, null: false, foreign_key: true
      t.float :total

      t.timestamps
    end
  end
end
