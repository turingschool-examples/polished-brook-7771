class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def render_projects
    names = []
    self.projects.each do |project|
      names << project.name
    end
    names.join(", ")
  end
end
