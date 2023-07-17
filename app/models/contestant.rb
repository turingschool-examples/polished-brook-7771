class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects, source: :project

  validates_presence_of :name, :age, :hometown, :years_of_experience

  def project_names
    self.projects.pluck(:name).join(', ')
  end
end
