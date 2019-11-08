class Proveedor < ApplicationRecord
  validates :nombre, presence: true
  validates :ruc, presence: true, length: { maximum: 9 }

end
