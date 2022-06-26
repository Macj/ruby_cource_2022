require "application_system_test_case"

class AutorsTest < ApplicationSystemTestCase
  setup do
    @autor = autors(:one)
  end

  test "visiting the index" do
    visit autors_url
    assert_selector "h1", text: "Autors"
  end

  test "should create autor" do
    visit autors_url
    click_on "New autor"

    fill_in "Age", with: @autor.age
    fill_in "City", with: @autor.city
    fill_in "Name", with: @autor.name
    click_on "Create Autor"

    assert_text "Autor was successfully created"
    click_on "Back"
  end

  test "should update Autor" do
    visit autor_url(@autor)
    click_on "Edit this autor", match: :first

    fill_in "Age", with: @autor.age
    fill_in "City", with: @autor.city
    fill_in "Name", with: @autor.name
    click_on "Update Autor"

    assert_text "Autor was successfully updated"
    click_on "Back"
  end

  test "should destroy Autor" do
    visit autor_url(@autor)
    click_on "Destroy this autor", match: :first

    assert_text "Autor was successfully destroyed"
  end
end
