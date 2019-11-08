class RepuestoServicio < ApplicationRecord
  validates :codigo, presence: true
  validates :descripcion, presence: true
  validates :costo, presence: true
  validates :precio_venta, presence: true


  def item_descripcion
    self.descipcion + self.codigo
  end
end
