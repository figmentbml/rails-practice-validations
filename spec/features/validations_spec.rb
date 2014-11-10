require 'rails_helper'

feature 'validations' do

  scenario 'Create user without first name' do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "Last name", with: "Doe"
    fill_in "Date of birth", with: "09/20/1986"
    click_on "Create Person"
    expect(page).to have_content("First name can't be blank")
  end

  scenario 'Create user without last name' do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "First name", with: "John"
    fill_in "Date of birth", with: "09/20/1986"
    click_on "Create Person"
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'Create user without DOB' do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    click_on "Create Person"
    expect(page).to have_content("Date of birth can't be blank")
  end

  scenario 'Create Organization without name' do
    visit root_path
    click_on "Organizations"
    click_on "New Organization"
    click_on "Create Organization"
    expect(page).to have_content("Name can't be blank")
  end
end
