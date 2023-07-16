class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def count_contestants
    Contestant.joins(:projects).where(projects: {id: self.id}).count
  end
end
