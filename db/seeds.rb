turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
library_garden.plots.create!(number: 2, size: "Small", direction: "South")
other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

plant1 = Plant.create!(name: 'cucumber', description: 'is tasty', days_to_harvest: 10)
plant2 = Plant.create!(name: 'tomato', description: 'is tasty', days_to_harvest: 10)
plant3 = Plant.create!(name: 'pumpkin', description: 'is not tasty', days_to_harvest: 10)
PlotPlant.create!(plot_id: turing_garden.id, plant_id: plant1.id)
PlotPlant.create!(plot_id: turing_garden.id, plant_id: plant2.id)
PlotPlant.create!(plot_id: other_garden.id, plant_id: plant3.id)

