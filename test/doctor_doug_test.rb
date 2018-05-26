# frozen_string_literal: true

require 'test_helper'

class DoctorDougTest < Minitest::Test
  User = Struct.new(:name, :password) do
  end
  def setup
    @users_collection = 10.times.collect do |i|
      User.new("user#{i}", "#{i}")
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::DoctorDoug::VERSION
  end

  def test_notify_with_no_block_given
    assert_raises NoneBlockGivenError do
      DoctorDoug.checkup 'user name should not be blank' do
        notify :if, any: @users_collection
      end
    end
  end
end
