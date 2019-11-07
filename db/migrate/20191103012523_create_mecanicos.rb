class CreateMecanicos < ActiveRecord::Migration[6.0]
  def change
    create_table :mecanicos do |t|
      t.string :especialidad
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
