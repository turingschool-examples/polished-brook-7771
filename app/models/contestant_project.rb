class ContestantProject < ApplicationRecord
  belongs_to :contestant
  belongs_to :project
  has_many :projects
end
