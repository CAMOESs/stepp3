class Task < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :deadline_on, presence: true
    validates :priority, presence: true
    validates :status, presence: true
    paginates_per 10
    enum priority: {高:0, 中:1, 低:2 }
    enum status: {未着手:0, 着手中:1, 完了:2}

    scope :StatuS, ->(title,n) { where("title LIKE ? AND status = ?",title,n)}
    scope :titlE, ->(title) { where("title LIKE ? ",'%'+title+'%')}
    scope :statuS, ->(status) { where("status = ?",status)}
    scope :deadline_oN, -> { all.order(deadline_on: :asc)}
    scope :prioritY, -> { all.order(priority: :desc )}
    
end