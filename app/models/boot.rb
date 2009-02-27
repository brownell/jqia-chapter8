class Boot < ActiveRecord::Base
  has_many :colors

  def initialize(params=nil)
    super(params)
    self.attribute_names.each do |a|
      self[a] = '---'
    end
  end

  def color_string
    self.name == '---' ? '---' : self.colors.collect {|c| c.name }.join(', ')
  end
end
