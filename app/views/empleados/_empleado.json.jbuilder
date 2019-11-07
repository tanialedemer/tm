json.extract! empleado, :id, :nombre, :apellido, :fecha_nac, :documento, :telefono, :especialidad, :fecha_contratacion, :salario, :usuario_id, :direccion, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
