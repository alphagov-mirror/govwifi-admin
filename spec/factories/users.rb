FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@gov.uk"
    end
    password { '123456' }
    name { "bob" }
    confirmed_at { Time.zone.now }

    trait :super_admin do
      otp_secret_key { 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' } # 2FA is set up

      after(:create) do |user|
        create(:organisation, users: [user], super_admin: true)
      end
    end

    trait :with_organisation do
      after(:create) do |user|
        create(:organisation, users: [user])
      end
    end

    trait :super_admin_without_organisation do
      otp_secret_key { 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' } # 2FA is set up

      is_superadmin { true  }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
