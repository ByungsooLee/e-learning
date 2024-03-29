class Category < ApplicationRecord
    validates :title,presence:true,length:{ maximum:50 }
    validates :description,presence:true,length:{ maximum:225 }
    has_many :words, dependent: :destroy
    has_many :lessons, dependent: :destroy
    has_many :answers,through: :lessons
end
