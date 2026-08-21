# Challenge name: Number of good pairs
#
# Given an array of integers nums.
# A pair (i,j) is called good if nums[i] == nums[j] and i < j.
# Return the number of good pairs.
#
# @param {Integer[]} nums
# @return {Integer}
#

#
# Approach 1: Hash
#
# Time Complexity: O(n)
def num_identical_pairs(nums)
warn("[DEBUG] >>> Entering num_identical_pairs(nums=#{nums})")
  hash = Hash.new(0)

warn("[DEBUG] num_identical_pairs(nums=#{nums}): hash → <redacted>")
  nums.each do |num|
    hash[num] = hash[num] + 1
  end

  counter = 0
warn("[DEBUG] num_identical_pairs(nums=#{nums}): counter → #{counter}")
  # Count how many times each number appears.
  # If a number appears n times, then n * (n – 1) / 2 good pairs
  # can be made with this number.
  hash.values.each do |val|
    counter += (val * (val - 1) / 2)
  end

  counter
warn("[DEBUG] <<< Exiting num_identical_pairs(nums=#{nums})")
end

nums = [1, 2, 3, 1, 1, 3]
puts(num_identical_pairs(nums))
# Output: 4

nums = [1, 1, 1, 1]
puts(num_identical_pairs(nums))
# Output: 6

nums = [1, 2, 3]
puts(num_identical_pairs(nums))
# Output: 0
