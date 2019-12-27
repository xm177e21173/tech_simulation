class Plan < ApplicationRecord
    validates :marriage, presence: true
    validates :sons,     presence: true
    validates :birth,    presence: true
end
