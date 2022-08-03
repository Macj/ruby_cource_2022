require "application_system_test_case"

class SparesTest < ApplicationSystemTestCase
  setup do
    @spare = spares(:one)
  end

  test "visiting the index" do
    visit spares_url
    assert_selector "h1", text: "Spares"
  end

  test "should create spare" do
    visit spares_url
    click_on "New spare"

    fill_in "Name", with: @spare.name
    fill_in "Price", with: @spare.price
    click_on "Create Spare"

    assert_text "Spare was successfully created"
    click_on "Back"
  end

  test "should update Spare" do
    visit spare_url(@spare)
    click_on "Edit this spare", match: :first

    fill_in "Name", with: @spare.name
    fill_in "Price", with: @spare.price
    click_on "Update Spare"

    assert_text "Spare was successfully updated"
    click_on "Back"
  end

  test "should destroy Spare" do
    visit spare_url(@spare)
    click_on "Destroy this spare", match: :first

    assert_text "Spare was successfully destroyed"
  end
end
