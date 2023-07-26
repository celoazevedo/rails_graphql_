# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(name: "Test User", email: "email@example.com", password: "123456")
  }

  it "is valid with a name, email and password" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
end
