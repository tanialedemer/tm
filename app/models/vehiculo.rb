class Vehiculo < ApplicationRecord
  belongs_to :cliente
  validates :modelo, presence: true
  validates :matricula, presence: true
  validates :marca, presence: true
  validates :km, presence: true
  validates :chasis, presence: true
  validates_presence_of :year_fab
end
