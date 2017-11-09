class GeneralSetting < ApplicationRecord
	scope :shod, ->(id) { where(id: id).take }
	validates :registered_name, presence: true, format: { with: /\A[a-zA-Z.&, " "]+\z/ },
                                     length: { in: 1..100 }, on: :update
end
