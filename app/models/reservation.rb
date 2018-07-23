class Reservation < ApplicationRecord
  belongs_to :customers, optional: true
  before_create :generate_reservation_code
  after_create :send_reservation_code
  validates :date, presence: true

  private
  def generate_reservation_code
    @code = (0...6).map{ (65 + rand(26)).chr }.join
    self.reservation_code = @code
  end

  private
  def send_reservation_code
    puts "Reservation code sending... Your Reservation Code #{self.reservation_code}"
  end
end
