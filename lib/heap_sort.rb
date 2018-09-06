require_relative "heap"

class Array
  def heap_sort!
    arr = self
    i=0
    prc = Proc.new {|x,y| y <=> x}
    while i < arr.length
      arr = BinaryMinHeap.heapify_up(arr, i, i+i, &prc)
      i += 1
    end

    j=1
    while j<arr.length
      arr[0], arr[arr.length-j] = arr[arr.length-j],arr[0]
      arr = BinaryMinHeap.heapify_down(arr, 0, arr.length-j, &prc)
      j+=1
    end
    arr
  end
end
