class OrdenTrabajo < ApplicationRecord
  belongs_to :mecanico
  belongs_to :cliente
  has_many :detalle_orden_trabajos, dependent: :destroy
  accepts_nested_attributes_for :detalle_orden_trabajos, allow_destroy: true
end
