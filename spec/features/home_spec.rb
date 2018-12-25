require 'rails_helper'

RSpec.feature 'Home Feature', type: :feature, :order => :defined do
  context "Scenarios in the home page" do
    scenario "Visit home and see the shop title" do
      visit home_index_path
      expect(page).to have_content('Minion Shop')
    end
  end
end
