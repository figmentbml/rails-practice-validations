require 'rails_helper'

describe Organization do

  it "validates the presence of the name" do
    organization = Organization.new
    organization.valid?
    expect(organization.errors[:name].present?).to eq(true)

    organization.name = "Greeter"
    organization.valid?
    expect(organization.errors[:name].present?).to eq(false)
  end

  it "validates the uniqueness of the name" do
    Organization.create!(name: "Girl Scouts")
    organization = Organization.new(name: "Girl Scouts")
    organization.valid?
    expect(organization.errors[:name].present?).to eq(true)

    organization = Organization.new(name: "Boy Scouts")
    organization.valid?
    expect(organization.errors[:name].present?).to eq(false)
  end

end
