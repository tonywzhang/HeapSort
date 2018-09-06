class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract

  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, self.count - 1, &prc)
  end

  def length
    @store.length
  end

  public
  def self.child_indices(len, parent_index)
    result = []
    left = (parent_index * 2 + 1) if (parent_index * 2 + 1) <= len -1
    right = (parent_index * 2 + 2) if (parent_index * 2 + 2) <= len -1
    result << left unless left == nil
    result << right unless right == nil
    result
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    return child_index/2 if child_index%2 == 1
    return child_index/2 -1
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    left_idx, right_idx = child_indices(len, parent_idx)

    parent_val = array[parent_idx]

    children = []
    children << array[left_idx] if left_idx
    children << array[right_idx] if right_idx

    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end

    swap_idx = nil
    if children.length == 1
      swap_idx = left_idx
    else
      swap_idx =
      prc.call(children[0], children[1]) == -1 ? left_idx : right_idx
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]

    if prc.call(child_val, parent_val) >= 0
      return array
    else
      array[child_idx], array[parent_idx] = parent_val, child_val
      heapify_up(array, parent_idx, len, &prc)
    end
  end
end
