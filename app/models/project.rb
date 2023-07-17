class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def average_years_experience
    total_experience = contestants.sum(:years_of_experience)
    number_of_contestants = contestants.count

    if number_of_contestants.positive?
      average_experience = total_experience.to_f / number_of_contestants
      average_experience.round(2)
    else
      0 # In case there are no contestants
    end
  end
end
