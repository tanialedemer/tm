require "application_system_test_case"

class MecanicosTest < ApplicationSystemTestCase
  setup do
    @mecanico = mecanicos(:one)
  end

  test "visiting the index" do
    visit mecanicos_url
    assert_selector "h1", text: "Mecanicos"
  end

  test "creating a Mecanico" do
    visit mecanicos_url
    click_on "New Mecanico"

    fill_in "Empleado", with: @mecanico.empleado_id
    fill_in "Especialidad", with: @mecanico.especialidad
    click_on "Create Mecanico"

    assert_text "Mecanico was successfully created"
    click_on "Back"
  end

  test "updating a Mecanico" do
    visit mecanicos_url
    click_on "Edit", match: :first

    fill_in "Empleado", with: @mecanico.empleado_id
    fill_in "Especialidad", with: @mecanico.especialidad
    click_on "Update Mecanico"

    assert_text "Mecanico was successfully updated"
    click_on "Back"
  end

  test "destroying a Mecanico" do
    visit mecanicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mecanico was successfully destroyed"
  end
end
