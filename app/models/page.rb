# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ActiveRecord::Base

  belongs_to :site , :dependent => :destroy
end
