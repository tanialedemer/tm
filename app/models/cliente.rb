class Cliente < ApplicationRecord
  validates :ruc, presence: true
  validates :nombre, presence: true
  validates :apellido, presence: true
end
