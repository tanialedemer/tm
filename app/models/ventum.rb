class Ventum < ApplicationRecord
  belongs_to :cliente
  belongs_to :orden_trabajo
end
