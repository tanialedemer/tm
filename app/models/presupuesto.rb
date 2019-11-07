class Presupuesto < ApplicationRecord
  belongs_to :cliente
  has_many :detalle_orden_presupuestos, dependent: :destroy
  accepts_nested_attributes_for :detalle_orden_presupuestos, allow_destroy: true
end
