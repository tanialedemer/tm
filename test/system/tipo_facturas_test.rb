require "application_system_test_case"

class TipoFacturasTest < ApplicationSystemTestCase
  setup do
    @tipo_factura = tipo_facturas(:one)
  end

  test "visiting the index" do
    visit tipo_facturas_url
    assert_selector "h1", text: "Tipo Facturas"
  end

  test "creating a Tipo factura" do
    visit tipo_facturas_url
    click_on "New Tipo Factura"

    fill_in "Descripcion", with: @tipo_factura.descripcion
    click_on "Create Tipo factura"

    assert_text "Tipo factura was successfully created"
    click_on "Back"
  end

  test "updating a Tipo factura" do
    visit tipo_facturas_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @tipo_factura.descripcion
    click_on "Update Tipo factura"

    assert_text "Tipo factura was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo factura" do
    visit tipo_facturas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo factura was successfully destroyed"
  end
end
