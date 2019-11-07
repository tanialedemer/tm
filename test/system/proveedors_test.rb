require "application_system_test_case"

class ProveedorsTest < ApplicationSystemTestCase
  setup do
    @proveedor = proveedors(:one)
  end

  test "visiting the index" do
    visit proveedors_url
    assert_selector "h1", text: "Proveedors"
  end

  test "creating a Proveedor" do
    visit proveedors_url
    click_on "New Proveedor"

    fill_in "Direccion", with: @proveedor.direccion
    fill_in "Email", with: @proveedor.email
    fill_in "Nombre", with: @proveedor.nombre
    fill_in "Ruc", with: @proveedor.ruc
    fill_in "Telefono", with: @proveedor.telefono
    click_on "Create Proveedor"

    assert_text "Proveedor was successfully created"
    click_on "Back"
  end

  test "updating a Proveedor" do
    visit proveedors_url
    click_on "Edit", match: :first

    fill_in "Direccion", with: @proveedor.direccion
    fill_in "Email", with: @proveedor.email
    fill_in "Nombre", with: @proveedor.nombre
    fill_in "Ruc", with: @proveedor.ruc
    fill_in "Telefono", with: @proveedor.telefono
    click_on "Update Proveedor"

    assert_text "Proveedor was successfully updated"
    click_on "Back"
  end

  test "destroying a Proveedor" do
    visit proveedors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proveedor was successfully destroyed"
  end
end
