require 'rails_helper'

RSpec.describe 'Plots index page' do
  it 'displays all plot numbers' do
    garden = Garden.create!(name: 'Garden', organic: true)
    plot1 = garden.plots.create!(number: 1, size: 'small', direction: 'east')
    plot2 = garden.plots.create!(number: 2, size: 'small', direction: 'east')
    plot3 = garden.plots.create!(number: 3, size: 'small', direction: 'east')

    visit plots_path

    expect("1").to appear_before("2") 
    expect("2").to appear_before("3") 
  end

  it 'displays all a plots plants under the plot' do
    garden = Garden.create!(name: 'Garden', organic: true)
    plot1 = garden.plots.create!(number: 1, size: 'small', direction: 'east')
    plot2 = garden.plots.create!(number: 2, size: 'small', direction: 'east')
    plant1 = Plant.create!(name: 'cucumber', description: 'is tasty', days_to_harvest: 10)
    plant2 = Plant.create!(name: 'tomato', description: 'is tasty', days_to_harvest: 10)
    plant3 = Plant.create!(name: 'pumpkin', description: 'is not tasty', days_to_harvest: 10)
    PlotPlant.create!(plot_id: plot1.id, plant_id: plant1.id)
    PlotPlant.create!(plot_id: plot1.id, plant_id: plant2.id)
    PlotPlant.create!(plot_id: plot2.id, plant_id: plant3.id)

    visit plots_path

    within "#id-#{plot1.id}" do
      expect(page).to have_content("cucumber")
      expect(page).to have_content("tomato")
    end

    within "#id-#{plot2.id}" do
      expect(page).to have_content("pumpkin")
    end
  end
end