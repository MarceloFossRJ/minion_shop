require 'rails_helper'

RSpec.feature 'Browse Minions Feature', type: :feature, :order => :defined do
  before do
    14.times{FactoryBot.create(:product)}
    @product = FactoryBot.create(:product)
  end
  context "Visit home and see the list of available minions" do
    scenario "I can see the list of minions with name, short description and picture" do
      visit root_path

      expect(page).to have_css("table#product-table tr", :count => 15)
      expect(page).to have_content("Minion-" , :count => 15)
      expect(page).to have_content("Lorem" , :count => 15)
      expect(page).to have_xpath("//td/img", :count => 15)

    end
    scenario "I can click on Reservar to see the details of the minion" do
      visit root_path
      click_on("Reservar", match: :first)

      expect(page).to have_content("Minion-")
      expect(page).to have_content("Lorem")
    end
  end

  context "Visit Minion details page" do
    scenario "I can click on button Voltar to go to Minions list page" do
      visit product_path(@product)
      click_on('Voltar')
      expect(page).to have_css("table#product-table tr", :count => 15)
    end
  end
end
