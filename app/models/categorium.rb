class Categorium < ApplicationRecord
	has_many :repuesto_servicios
  	validates :descripcion, presence: true
end
