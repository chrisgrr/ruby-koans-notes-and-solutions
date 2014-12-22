require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array
  end

    # Elements of an array can be updated by their index number. << pushes a new element onto the end of the array.

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
  end
  
  # Slicing does not identify the element, but places it between index numbers to define a span. 0 :peanut 1 :butter 2 :and 3 :jelly 4. When slicing, 4 is part of the array, but there is no index 5. array[4] would return nil as it is accessing the element directly rather than a span.

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  # Slicing with ranges works by telling the array to slice from the first index number to the second index number.

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1, 2, :last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1, 2], array
  end

  # push and pop are destructive.

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end

  # shift and unshift are also destructive.

end
