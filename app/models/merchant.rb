# == Schema Information
#
# Table name: merchants
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  merchant_name          :string
#  merchant_address       :text
#  avatar_data            :text
#  pic_name               :string
#  pic_phone_number       :string
#  pic_address            :text
#  instagram              :string
#  tiktok                 :string
#  website                :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Merchant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include General
  include ImageUploader::Attachment(:avatar)

  STATUS = ["pending", "approved", "rejected"]

  has_one :wallet, dependent: :destroy, foreign_key: "userable_id"

  has_many :products, dependent: :destroy

  after_create :set_wallet
end
