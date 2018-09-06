require_relative 'heap'

def k_largest_elements(array, k)
  # array.sort!.reverse!
  # array[0..k-1].reverse!

  # nlog(n) run time. try to improve
  array.heap_sort!.reverse![0..k-1].reverse!
end
