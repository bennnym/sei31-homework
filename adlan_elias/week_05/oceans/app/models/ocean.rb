# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :text
#  depth      :integer
#  volume     :integer
#  size       :integer
#  fact       :text
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ocean < ActiveRecord::Base
end
