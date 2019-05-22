# == Schema Information
#
# Table name: mountains
#
#  id      :integer          not null, primary key
#  name    :text
#  country :text
#  city    :text
#  image   :text
#

class Mountain < ActiveRecord::Base
end
