class Api::V1::MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :episode_number, :serie_id
  belongs_to :serie

  attribute :category do |object|
    object.category&.name
  end

  attribute :reviews_count do |object|
    object.reviews.count
  end

  attribute :favorite do |object, params|
    if params.present? && params.has_key?(:user)
      params[:user].favorites.where(favoritable: object).exists?
    end
  end

  attribute :thumbnail_url do |object|
    'public/gil.png'
  end

  attribute :thumbnail_cover_url do |object|
    'public/gil.png'
  end

  attribute :featured_thumbnail_url do |object|
    if object[:featured_thumbnail_key].present?
      'public/gil.png'
    end
  end

  attribute :video_url do |object|
    'public/videos/RailsConf 2016 - Succession by Katrina Owen.mp4'
  end
end
