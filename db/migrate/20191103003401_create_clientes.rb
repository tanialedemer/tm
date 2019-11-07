class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.text :direccion
      t.string :telefono
      t.text :email
      t.string :documento
      t.integer :ruc

      t.timestamps
    end
  end
end
