# Challenge name: Richest Customer Wealth
#
# You are given an m x n integer grid accounts where accounts[i][j]
# is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank.
#
# Return the wealth that the richest customer has.
# A customer's wealth is the amount of money they have in all
# their bank accounts. The richest customer is the customer that
# has the maximum wealth.
#
# Example 1:
# Input: accounts = [[1,2,3],[3,2,1]]
# Output: 6
# Explanation:
# 1st customer has wealth = 1 + 2 + 3 = 6
# 2nd customer has wealth = 3 + 2 + 1 = 6
# Both customers are considered the richest with a wealth of 6
# each, so return 6.
#
# Example 2:
# Input: accounts = [[1,5],[7,3],[3,5]]
# Output: 10
# Explanation:
# 1st customer has wealth = 6
# 2nd customer has wealth = 10
# 3rd customer has wealth = 8
# The 2nd customer is the richest with a wealth of 10.
#
# Example 3:
# Input: accounts = [[2,8,7],[7,1,3],[1,9,5]]
# Output: 17

#
# Approach: Brute Force
#
# Time Complexity: O(n)
#
def find_richest_customer_wealth(accounts)
warn("[ERROR] >>> Entering find_richest_customer_wealth(accounts=#{accounts})")
  summed_accounts = []
  accounts.each do |customer|
    summed = 0
	warn("[DEBUG] find_richest_customer_wealth(accounts=#{accounts}): summed_accounts → #{summed_accounts}")
    customer.each do |account|
	warn("[DEBUG] find_richest_customer_wealth(accounts=#{accounts}): summed → #{summed}")
      summed += account
    end
    summed_accounts.push(summed)
  end

warn("[WARN] <<< Exiting find_richest_customer_wealth(accounts=#{accounts})")
  summed_accounts.sort.pop
end

puts find_richest_customer_wealth([[1, 2, 3], [3, 2, 1]])
# => 6
puts find_richest_customer_wealth([[1, 5], [7, 3], [3, 5]])
# => 10
puts find_richest_customer_wealth([[2, 8, 7], [7, 1, 3], [1, 9, 5]])
# => 17
