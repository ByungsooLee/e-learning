class Category < ApplicationRecord
    validates :title,presence:true,length:{ maximum:50 }
    validates :description,presence:true,length:{ maximum:225 }
    has_many :words
    has_many :lessons
end
