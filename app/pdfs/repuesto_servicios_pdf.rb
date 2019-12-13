class RepuestoServiciosPdf < Prawn::Document
  def initialize(repuesto_servicios)
    super()
    @repuesto_servicios = repuesto_servicios
    header
    body
  end

  def header
    image "#{Rails.root}/app/assets/images/logo-header.png", width: 540, height: 75, :at => [0, 740]
    draw_text "Dirección de Recursos Materiales", :at => [185,660]
  end

  def body
    move_down 90
    table_content
  end

  def table_content
    table repuesto_servicios_rows do
      row(0).font_style = :bold
      row(0).background_color = 'dbdee2'
      self.cell_style = {size: 9, border_color: 'd6d8db'}
      self.column_widths = [60, 250, 100]
    end
  end

  def repuesto_servicios_rows
    [ [{:content => "Total de Artículos en Inventario", :colspan =>5}],
      ['Código', 'Descripción', 'Stock', 'Precio Venta', 'Precio Compra'] ] +
      @repuesto_servicios.map do |articulo|
      [articulo.codigo, articulo.descripcion, articulo.stock.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse, articulo.precio_venta, articulo.costo]
    end
  end

end
