class Ventum < ApplicationRecord
  belongs_to :tipo_factura
  belongs_to :cliente
  belongs_to :orden_trabajo
end
