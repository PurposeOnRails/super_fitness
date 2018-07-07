require 'test_helper'

class AccessCodeTest < ActiveSupport::TestCase
  def setup
    @ac = AccessCode.new(description: 'For research', purpose_id: 1)
  end

  test 'it generates a random code of length 32' do
    @ac.save
    assert_equal 32, @ac.code.length
  end

  test 'it ignores a given code' do
    ac = AccessCode.new(
      description: 'For charite cancer reserach',
      purpose_id: 3,
      code: 'an insecure code'
    )
    ac.save
    assert ac.code.length == 32
  end

  test 'it is invalid when description is missing' do
    ac = AccessCode.new(purpose_id: 3)
    assert_not ac.save
  end

  test 'it is invalid when purpose_id is missing' do
    ac = AccessCode.new(description: 'Hmmmm')
    assert_not ac.save
  end
end
