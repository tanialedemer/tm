class CreateEmpleados < ActiveRecord::Migration[6.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nac
      t.string :documento
      t.string :telefono
      t.string :especialidad
      t.date :fecha_contratacion
      t.float :salario
      t.text :direccion

      t.timestamps
    end
  end
end
