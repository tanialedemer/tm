class Proveedor < ApplicationRecord
  validates :nombre, presence: true
  validates :ruc, presence: true

end
