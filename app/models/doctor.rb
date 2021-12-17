class Doctor < ApplicationRecord

    validates :fullname, presence: true, uniqueness: {case_sensitive: false}
    validates :PracticeLocation, presence: true
    validates :specialist, presence: true
    validates :profile, presence: true
    
    has_one_attached :avatar
    def avatar_url
        Rails.application.routes.url_helpers.rails_blob_url(
        avatar.blob, only_path: true)
        return avatar.service_url
    end   
end