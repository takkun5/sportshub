class Trainer < User
    
    validates :speciality, presence: true
    has_many :training_contents
end
