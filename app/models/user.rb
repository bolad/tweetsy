class User < ApplicationRecord
  has_many :packs

  class << self
    def from_omniauth(auth)
      # where(auth.slice('provider', 'uid')).first || create_from_omniauth(auth)
      where(uid: auth['uid']) || create_from_omniauth(auth)
    end

    def create_from_omniauth(auth)
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.name = auth['info']['nickname']
      end
    end
  end
end
