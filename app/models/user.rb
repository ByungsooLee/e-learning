class User < ApplicationRecord
    before_save {email.downcase!}
    # REGEX = Regular expression
    # To validate correct email structure
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
   
    validates :name,presence:true,length:{ maximum:50 }
    validates :email,presence:true,length:{ maximum:225 },
                format:{with:EMAIL_REGEX},
                uniqueness: {case_senmsitive: false }

    has_secure_password
    validates :password,length:{ minimum:6 },allow_nil: true
end