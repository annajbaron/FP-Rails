class FollowSerializer < ActiveModel::Serializer
  attributes :id, :brand_id, :user_id, :brand

  def brand
    object.brand
  end
end
