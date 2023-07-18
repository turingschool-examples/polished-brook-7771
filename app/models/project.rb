class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def avg_experience
    years = []
    self.contestants.each do |contestant|
      years << contestant.years_of_experience.to_f
    end
    if years.count != 0
      (years.sum)/(years.count)
    else
      0
    end
  end
end
