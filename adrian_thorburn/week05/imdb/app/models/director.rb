# == Schema Information
#
# Table name: directors
#
#  id          :integer          not null, primary key
#  name        :text
#  nationality :text
#  dob         :date
#  style       :text
#  image       :text
#

class Director < ActiveRecord::Base

end
