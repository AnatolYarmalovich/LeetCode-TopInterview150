
import Foundation

/*
 169. Majority Element
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2

 Constraints:

 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109

 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */


class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        let result = Int(nums.count / 2)
        var countMap: [Int: Int] = [:]

        for num in nums {
            if countMap[num] == nil {
                countMap[num] = 1
            } else {
                countMap[num]! += 1
            }

            if countMap[num] != nil && countMap[num]! > result {
                return num
            }
        }

        return 0
    }
}

func firstTestsCase() {
    let input = [3,2,3]
    let result = Solution169().majorityElement(input)
    print("Input: \(input)")
    print("Result: \(result)")
    assert(result == 3, "Test failed")
    print("✅ \(#function) passed")

}

func secondTestsCase() {
    let input = [2,2,1,1,1,2,2]
    let result = Solution169().majorityElement(input)
    print("Input: \(input)")
    print("Result: \(result)")
    assert(result == 2, "Test failed")
    print("✅ \(#function) passed")

}


func runAllTests() {
    firstTestsCase()
    secondTestsCase()
}

runAllTests()
