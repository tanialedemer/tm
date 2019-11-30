class CreateOrdenTrabajos < ActiveRecord::Migration[6.0]
  def change
    create_table :orden_trabajos do |t|
      t.text :descripcion
      t.references :empleado, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.integer :num_orden
      t.float :total

      t.timestamps
    end
  end
end
