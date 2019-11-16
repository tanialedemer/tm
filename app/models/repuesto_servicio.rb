class RepuestoServicio < ApplicationRecord
  validates :codigo, presence: true, uniqueness: true
  validates :descripcion, presence: true
  validates :costo, presence: true, numericality: { only_integer: true }
  validates :precio_venta, presence: true,  numericality: { only_integer: true }


  def item_descripcion
    self.descipcion + self.codigo
  end
end
