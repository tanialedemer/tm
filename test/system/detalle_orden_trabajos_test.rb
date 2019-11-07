require "application_system_test_case"

class DetalleOrdenTrabajosTest < ApplicationSystemTestCase
  setup do
    @detalle_orden_trabajo = detalle_orden_trabajos(:one)
  end

  test "visiting the index" do
    visit detalle_orden_trabajos_url
    assert_selector "h1", text: "Detalle Orden Trabajos"
  end

  test "creating a Detalle orden trabajo" do
    visit detalle_orden_trabajos_url
    click_on "New Detalle Orden Trabajo"

    fill_in "Cantidad", with: @detalle_orden_trabajo.cantidad
    fill_in "Orden trabajo", with: @detalle_orden_trabajo.orden_trabajo_id
    fill_in "Precio venta", with: @detalle_orden_trabajo.precio_venta
    fill_in "Repuesto servicio", with: @detalle_orden_trabajo.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_orden_trabajo.subtotal
    fill_in "Total", with: @detalle_orden_trabajo.total
    click_on "Create Detalle orden trabajo"

    assert_text "Detalle orden trabajo was successfully created"
    click_on "Back"
  end

  test "updating a Detalle orden trabajo" do
    visit detalle_orden_trabajos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @detalle_orden_trabajo.cantidad
    fill_in "Orden trabajo", with: @detalle_orden_trabajo.orden_trabajo_id
    fill_in "Precio venta", with: @detalle_orden_trabajo.precio_venta
    fill_in "Repuesto servicio", with: @detalle_orden_trabajo.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_orden_trabajo.subtotal
    fill_in "Total", with: @detalle_orden_trabajo.total
    click_on "Update Detalle orden trabajo"

    assert_text "Detalle orden trabajo was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle orden trabajo" do
    visit detalle_orden_trabajos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle orden trabajo was successfully destroyed"
  end
end
