class TipoFactura < ApplicationRecord
  validates :descripcion, presence: true
end
