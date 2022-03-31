class Test < ApplicationRecord

  before_create :set_position
  after_destroy :update_positions

  private
    def set_position
      max_postion = Test.maximum("position")
      self.position = max_postion.to_i + 1
    end

    def update_positions
      Test.where("position > #{self.position}").update_all('position = position - 1')
    end
end