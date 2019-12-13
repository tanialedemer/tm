class ClientesPdf < Prawn::Document
  def initialize(clientes)
    super()
    @clientes = clientes
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "Lista de Proveedores", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table clients_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [250, 150, 140]
    end
  end

  def clients_rows
    [ [{:content => "Clientes", :colspan =>5}],
      ['Nombre', 'Apellido', 'Teléfono', 'RUC'] ] +
      @clientes.map do |clientes|
      [clientes.nombre,clientes.apellido, clientes.telefono, clientes.ruc]
    end
  end

end
