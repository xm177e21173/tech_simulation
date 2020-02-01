class Plan < ApplicationRecord
    validates :marriage,      presence: true
    validates :sons,          presence: true
    validates :birth,         presence: true
    validates :user_id,       presence: true
    validates :retirement,    presence: true
    validates :severance,     presence: true
    validates :when_marriage, presence: true
    validates :wedding,       presence: true
    validates :myhome,        presence: true
    validates :saving,        presence: true
    validates :first_son,     presence: true
    validates :last_son,      presence: true
end
