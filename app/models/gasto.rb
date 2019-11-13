class Gasto < ApplicationRecord
  validates :fecha_compra, presence: true
  validates :motivo, presence: true
  validates :descripcion, presence: true
  validates :costo, presence: true
end
