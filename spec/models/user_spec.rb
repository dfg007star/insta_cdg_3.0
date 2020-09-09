require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations tests" do
    let (:user) { build(:user) }
    it "ensures name presence" do
      # user = User.new(email: "lol@example.com", password: "password", password_confirmation: "password").save
      user.name = nil
      expect(user.save).to eq(false)
    end

    it "ensures email presence" do
      # user = User.new(name: "Dima Osin", password: "password", password_confirmation: "password").save
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "ensures password confirmation" do
      # user = User.new(name: "Dima Osin", email: "lol@example.com", password: "password", password_confirmation: "passwor").save
      user.password_confirmation = "passwor"
      expect(user.save).to eq(false)
    end

    it "save successfully" do
      # user = User.new(name: "Dima Osin", email: "lol@example.com", password: "password", password_confirmation: "password").save
      expect(user.save).to eq(true)
    end

  end
end
