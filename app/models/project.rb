class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def count_contestants
    Contestant.joins(:projects).where(projects: {id: self.id}).count
  end

  def average_contestant_experience
    years = Contestant.joins(:projects).where(projects: {id: self.id}).average(:years_of_experience)
    return "N/A" if years.nil?
    # any active record methods that return a string if nil?
    years.round(1)
    # put round in view originally since it's "display logic"
    # got error that round doesn't work on "N/A" string
  end
end
