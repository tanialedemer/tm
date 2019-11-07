class CreateProveedors < ActiveRecord::Migration[6.0]
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.text :direccion
      t.string :telefono
      t.text :email
      t.string :ruc

      t.timestamps
    end
  end
end
