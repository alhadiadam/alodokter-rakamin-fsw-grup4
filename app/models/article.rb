class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: {case_sensitive: false}
    validates :body, presence: true
    
    has_one_attached :media
    def media_url
        Rails.application.routes.url_helpers.rails_blob_url(media.blob, only_path: true)
        return media.service_url
    end

end
