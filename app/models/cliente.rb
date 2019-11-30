class Cliente < ApplicationRecord
  validates :ruc, presence: true, uniqueness: true
  validates :nombre, presence: true
  validates :apellido, presence: true
  # validates :email, presence: true, email: true

  resourcify
end
