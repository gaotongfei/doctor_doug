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

  test 'that it has a version number' do
    refute_nil ::DoctorDoug::VERSION
  end

  test 'notify with no block given' do
    assert_raises NoneBlockGivenError do
      DoctorDoug.checkup 'user name should not be blank' do
        notify :if, any: @users_collection
      end
    end
  end
end
