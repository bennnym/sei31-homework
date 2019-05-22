# == Schema Information
#
# Table name: oceans
#
#  id        :integer          primary key
#  name      :text
#  location  :text
#  area      :float
#  volume    :float
#  depth     :integer
#  coastline :integer
#  image     :text
#

class Ocean < ActiveRecord::Base
end
