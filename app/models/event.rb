# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  start       :datetime
#  description :text
#  repeat      :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
end
