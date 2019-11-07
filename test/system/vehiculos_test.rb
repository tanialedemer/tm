require "application_system_test_case"

class VehiculosTest < ApplicationSystemTestCase
  setup do
    @vehiculo = vehiculos(:one)
  end

  test "visiting the index" do
    visit vehiculos_url
    assert_selector "h1", text: "Vehiculos"
  end

  test "creating a Vehiculo" do
    visit vehiculos_url
    click_on "New Vehiculo"

    fill_in "Chasis", with: @vehiculo.chasis
    fill_in "Cliente", with: @vehiculo.cliente_id
    fill_in "Color", with: @vehiculo.color
    fill_in "Km", with: @vehiculo.km
    fill_in "Marca", with: @vehiculo.marca
    fill_in "Matricula", with: @vehiculo.matricula
    fill_in "Modelo", with: @vehiculo.modelo
    fill_in "Year fab", with: @vehiculo.year_fab
    click_on "Create Vehiculo"

    assert_text "Vehiculo was successfully created"
    click_on "Back"
  end

  test "updating a Vehiculo" do
    visit vehiculos_url
    click_on "Edit", match: :first

    fill_in "Chasis", with: @vehiculo.chasis
    fill_in "Cliente", with: @vehiculo.cliente_id
    fill_in "Color", with: @vehiculo.color
    fill_in "Km", with: @vehiculo.km
    fill_in "Marca", with: @vehiculo.marca
    fill_in "Matricula", with: @vehiculo.matricula
    fill_in "Modelo", with: @vehiculo.modelo
    fill_in "Year fab", with: @vehiculo.year_fab
    click_on "Update Vehiculo"

    assert_text "Vehiculo was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehiculo" do
    visit vehiculos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehiculo was successfully destroyed"
  end
end
