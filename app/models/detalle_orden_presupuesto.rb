class DetalleOrdenPresupuesto < ApplicationRecord
  belongs_to :presupuesto
  belongs_to :repuesto_servicio
end
