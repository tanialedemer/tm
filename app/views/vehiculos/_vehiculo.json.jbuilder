json.extract! vehiculo, :id, :modelo, :color, :matricula, :marca, :km, :chasis, :year_fab, :cliente_id, :created_at, :updated_at
json.url vehiculo_url(vehiculo, format: :json)
