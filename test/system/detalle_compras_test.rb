require "application_system_test_case"

class DetalleComprasTest < ApplicationSystemTestCase
  setup do
    @detalle_compra = detalle_compras(:one)
  end

  test "visiting the index" do
    visit detalle_compras_url
    assert_selector "h1", text: "Detalle Compras"
  end

  test "creating a Detalle compra" do
    visit detalle_compras_url
    click_on "New Detalle Compra"

    fill_in "Cantidad", with: @detalle_compra.cantidad
    fill_in "Compra", with: @detalle_compra.compra_id
    fill_in "Precio unitario", with: @detalle_compra.precio_unitario
    fill_in "Precio venta", with: @detalle_compra.precio_venta
    fill_in "Repuesto servicio", with: @detalle_compra.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_compra.subtotal
    click_on "Create Detalle compra"

    assert_text "Detalle compra was successfully created"
    click_on "Back"
  end

  test "updating a Detalle compra" do
    visit detalle_compras_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @detalle_compra.cantidad
    fill_in "Compra", with: @detalle_compra.compra_id
    fill_in "Precio unitario", with: @detalle_compra.precio_unitario
    fill_in "Precio venta", with: @detalle_compra.precio_venta
    fill_in "Repuesto servicio", with: @detalle_compra.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_compra.subtotal
    click_on "Update Detalle compra"

    assert_text "Detalle compra was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle compra" do
    visit detalle_compras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle compra was successfully destroyed"
  end
end
