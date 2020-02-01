class Cost < ApplicationRecord
  validates :user_id,       presence: true
  validates :edu_cost,      presence: true
  validates :old_cost,      presence: true
  validates :target,        presence: true
  validates :marriage_cost, presence: true
  validates :myhome_cost,   presence: true
  validates :othres,        presence: true
end