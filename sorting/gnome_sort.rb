def gnome_sort(arr)
warn("[DEBUG] >>> Entering gnome_sort(arr=#{arr})")
  i = 0
  while i < arr.length
    if i == 0 || arr[i] >= arr[i - 1]
      i += 1
    else
      arr[i], arr[i - 1] = arr[i - 1], arr[i]
      i -= 1
    end
  end
  arr
warn("[DEBUG] <<< Exiting gnome_sort(arr=#{arr})")
end
