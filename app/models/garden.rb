class Garden < ApplicationRecord
  has_many :plots

  def plants
    plots.joins(:plants)
        .select("DISTINCT plants.name, COUNT(plants.name) DESC")
        .where("plants.days_to_harvest < 100")
        .group("plants.name")
  end
end
