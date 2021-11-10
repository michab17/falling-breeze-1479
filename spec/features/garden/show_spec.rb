require 'rails_helper'

RSpec.describe 'Garden show page' do
  it 'displays a unique list of all the plants that 
  take less than 100 days to harvest in the garden' do
    garden = Garden.create!(name: 'Garden', organic: true)
    plot1 = garden.plots.create!(number: 1, size: 'small', direction: 'east')
    plot2 = garden.plots.create!(number: 2, size: 'small', direction: 'east')
    plant1 = Plant.create!(name: 'cucumber', description: 'is tasty', days_to_harvest: 10)
    plant2 = Plant.create!(name: 'tomato', description: 'is tasty', days_to_harvest: 10)
    plant3 = Plant.create!(name: 'pumpkin', description: 'is not tasty', days_to_harvest: 101)
    PlotPlant.create!(plot_id: plot1.id, plant_id: plant1.id)
    PlotPlant.create!(plot_id: plot1.id, plant_id: plant2.id)
    PlotPlant.create!(plot_id: plot2.id, plant_id: plant3.id)

    visit garden_show_path

    expect(page).to have_content('cucumber').once
    expect(page).to have_content('tomato').once
    expect(page).to_not have_content('pumkin')
  end
end