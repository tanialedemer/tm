json.extract! cliente, :id, :nombre, :apellido, :direccion, :telefono, :email, :documento, :ruc, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
