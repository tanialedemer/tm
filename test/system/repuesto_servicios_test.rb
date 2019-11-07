require "application_system_test_case"

class RepuestoServiciosTest < ApplicationSystemTestCase
  setup do
    @repuesto_servicio = repuesto_servicios(:one)
  end

  test "visiting the index" do
    visit repuesto_servicios_url
    assert_selector "h1", text: "Repuesto Servicios"
  end

  test "creating a Repuesto servicio" do
    visit repuesto_servicios_url
    click_on "New Repuesto Servicio"

    fill_in "Categoria", with: @repuesto_servicio.categoria
    fill_in "Codigo", with: @repuesto_servicio.codigo
    fill_in "Costo", with: @repuesto_servicio.costo
    fill_in "Descripcion", with: @repuesto_servicio.descripcion
    fill_in "Precio venta", with: @repuesto_servicio.precio_venta
    fill_in "Stock", with: @repuesto_servicio.stock
    click_on "Create Repuesto servicio"

    assert_text "Repuesto servicio was successfully created"
    click_on "Back"
  end

  test "updating a Repuesto servicio" do
    visit repuesto_servicios_url
    click_on "Edit", match: :first

    fill_in "Categoria", with: @repuesto_servicio.categoria
    fill_in "Codigo", with: @repuesto_servicio.codigo
    fill_in "Costo", with: @repuesto_servicio.costo
    fill_in "Descripcion", with: @repuesto_servicio.descripcion
    fill_in "Precio venta", with: @repuesto_servicio.precio_venta
    fill_in "Stock", with: @repuesto_servicio.stock
    click_on "Update Repuesto servicio"

    assert_text "Repuesto servicio was successfully updated"
    click_on "Back"
  end

  test "destroying a Repuesto servicio" do
    visit repuesto_servicios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repuesto servicio was successfully destroyed"
  end
end
