class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects


  def average_experience
    total_experience = contestants.sum(&:years_of_experience)
    (total_experience / contestants.count.to_f).round(2)
  end
end
