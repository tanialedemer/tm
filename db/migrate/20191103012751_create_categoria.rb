class CreateCategoria < ActiveRecord::Migration[6.0]
  def change
    create_table :categoria do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
