require "application_system_test_case"

class DetalleOrdenPresupuestosTest < ApplicationSystemTestCase
  setup do
    @detalle_orden_presupuesto = detalle_orden_presupuestos(:one)
  end

  test "visiting the index" do
    visit detalle_orden_presupuestos_url
    assert_selector "h1", text: "Detalle Orden Presupuestos"
  end

  test "creating a Detalle orden presupuesto" do
    visit detalle_orden_presupuestos_url
    click_on "New Detalle Orden Presupuesto"

    fill_in "Cantidad", with: @detalle_orden_presupuesto.cantidad
    fill_in "Orden trabajo", with: @detalle_orden_presupuesto.orden_trabajo_id
    fill_in "Precio unitario", with: @detalle_orden_presupuesto.precio_unitario
    fill_in "Presupuesto", with: @detalle_orden_presupuesto.presupuesto_id
    fill_in "Repuesto servicio", with: @detalle_orden_presupuesto.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_orden_presupuesto.subtotal
    fill_in "Total", with: @detalle_orden_presupuesto.total
    click_on "Create Detalle orden presupuesto"

    assert_text "Detalle orden presupuesto was successfully created"
    click_on "Back"
  end

  test "updating a Detalle orden presupuesto" do
    visit detalle_orden_presupuestos_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @detalle_orden_presupuesto.cantidad
    fill_in "Orden trabajo", with: @detalle_orden_presupuesto.orden_trabajo_id
    fill_in "Precio unitario", with: @detalle_orden_presupuesto.precio_unitario
    fill_in "Presupuesto", with: @detalle_orden_presupuesto.presupuesto_id
    fill_in "Repuesto servicio", with: @detalle_orden_presupuesto.repuesto_servicio_id
    fill_in "Subtotal", with: @detalle_orden_presupuesto.subtotal
    fill_in "Total", with: @detalle_orden_presupuesto.total
    click_on "Update Detalle orden presupuesto"

    assert_text "Detalle orden presupuesto was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle orden presupuesto" do
    visit detalle_orden_presupuestos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle orden presupuesto was successfully destroyed"
  end
end
