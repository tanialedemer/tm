require "application_system_test_case"

class PagoFacturasTest < ApplicationSystemTestCase
  setup do
    @pago_factura = pago_facturas(:one)
  end

  test "visiting the index" do
    visit pago_facturas_url
    assert_selector "h1", text: "Pago Facturas"
  end

  test "creating a Pago factura" do
    visit pago_facturas_url
    click_on "New Pago Factura"

    fill_in "Compra", with: @pago_factura.compra_id
    fill_in "Fecha", with: @pago_factura.fecha
    fill_in "Monto pago", with: @pago_factura.monto_pago
    fill_in "Proveedor", with: @pago_factura.proveedor_id
    click_on "Create Pago factura"

    assert_text "Pago factura was successfully created"
    click_on "Back"
  end

  test "updating a Pago factura" do
    visit pago_facturas_url
    click_on "Edit", match: :first

    fill_in "Compra", with: @pago_factura.compra_id
    fill_in "Fecha", with: @pago_factura.fecha
    fill_in "Monto pago", with: @pago_factura.monto_pago
    fill_in "Proveedor", with: @pago_factura.proveedor_id
    click_on "Update Pago factura"

    assert_text "Pago factura was successfully updated"
    click_on "Back"
  end

  test "destroying a Pago factura" do
    visit pago_facturas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pago factura was successfully destroyed"
  end
end
