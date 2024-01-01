# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string
#  phone_number           :string
#  avatar_data            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include ImageUploader::Attachment(:avatar)

  has_one :user_bank, class_name: "User::Bank", dependent: :destroy
  has_one :cart, dependent: :destroy, foreign_key: "userable_id"
  has_one :wallet, dependent: :destroy, foreign_key: "userable_id"

  has_many :orders, dependent: :destroy
  has_many :top_ups, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  has_many :wallet_histories, dependent: :destroy
  has_many :addresses, class_name: "User::Address", dependent: :destroy

  after_create :set_bank, :set_cart, :set_wallet

  def set_cart
    Cart.create(
      userable_id: self.id,
      userable_type: self.class.name
    ) if self.cart.blank?
  end

  def set_wallet
    Wallet.create(
      userable_id: self.id,
      userable_type: self.class.name
    ) if self.wallet.blank?
  end

  def set_bank
    User::Bank.create(user_id: self.id) if self.bank.blank?
  end
end
