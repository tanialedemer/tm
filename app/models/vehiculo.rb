class Vehiculo < ApplicationRecord
  belongs_to :cliente
  validates :modelo, presence: true
  validates :matricula, presence: true
  validates :marca, presence: true
  validates :km, presence: true
  validates :chasis, presence: true
  validates :year_fab, presence: true
end
