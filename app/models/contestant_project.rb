class ContestantProject < ApplicationRecord
belongs_to :contestant, dependent: :destroy
belongs_to :project, dependent: :destroy
end
