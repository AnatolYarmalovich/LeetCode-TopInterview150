/*
 Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.
 
 Example 1:
 
 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:
 
 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:
 
 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 
 
 Constraints:
 
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 
 
 Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 
 */

class Solution209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var leftPointer: Int = 0
        var rightPointer: Int = 0
        var sum: Int = 0
        var best: Int = nums.count + 1
        
        while rightPointer < nums.count {
            sum += nums[rightPointer]
            while sum >= target {
                let lenght = rightPointer - leftPointer + 1
                best = min(best, lenght)
                sum -= nums[leftPointer]
                leftPointer += 1
            }
            rightPointer += 1
        }
        
        if best == nums.count + 1 {
            return 0
        } else {
            return best
        }
    }
}

func firstTestCase() {
    let input = [2,3,1,2,4,3]
    let target = 7
    let result = Solution209().minSubArrayLen(target, input)
    assert(result == 2, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func secondTestCase() {
    let input = [1,4,4]
    let target = 4
    let result = Solution209().minSubArrayLen(target, input)
    assert(result == 1, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func thirdTestCase() {
    let input = [1,1,1,1,1,1,1,1]
    let target = 11
    let result = Solution209().minSubArrayLen(target, input)
    assert(result == 0, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
    thirdTestCase()
}

runAllTests()
