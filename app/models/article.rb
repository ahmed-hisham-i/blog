class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true , length: {minimum:5, maximum:10}
    validates :description, presence: true, length: {minimum:10, maximum:300}
    validates :user_id, presence: true
end
