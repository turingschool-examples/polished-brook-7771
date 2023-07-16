class Challenge < ApplicationRecord
  validates_presence_of :theme, :project_budget
  has_many :projects

  def self.find_by_project(id)
    where(id: Project.find(id).challenge_id)
  end
end
