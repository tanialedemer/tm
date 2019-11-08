class RepuestoServicio < ApplicationRecord

  def item_descripcion
    self.descipcion + self.codigo
  end
end
