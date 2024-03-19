namespace :wallet do
  desc "Regenerate wallet for merchant who doesn't have it on first seeds"
  task generate: :environment do
    Merchant.find_each do |merchant|
      if merchant.wallet.blank?
        Wallet.create(
          userable_id: merchant.id,
          userable_type: merchant.class.name
        )
      end
    end
  end
end
