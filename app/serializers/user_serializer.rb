class UserSerializer < ActiveModel::Serializer
  attributes :email, :admin, :premium, :user
end
