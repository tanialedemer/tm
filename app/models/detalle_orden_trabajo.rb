class DetalleOrdenTrabajo < ApplicationRecord
  belongs_to :orden_trabajo
  belongs_to :repuesto_servicio
end
