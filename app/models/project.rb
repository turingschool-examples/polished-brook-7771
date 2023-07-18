class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_experience_of_contestants
    total_experience = 0
    contestants.each do |contestant|
      total_experience += contestant.years_of_experience
    end
    (total_experience.to_f / contestants.count).round(1)
  end
end
