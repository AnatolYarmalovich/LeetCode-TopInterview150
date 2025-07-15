/*
 You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

 Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:

 0 <= j <= nums[i] and
 i + j < n
 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].



 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [2,3,0,1,4]
 Output: 2


 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 1000
 It's guaranteed that you can reach nums[n - 1].
 */

import Foundation

class Solution45 {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0
        var i = 0

        print("Starting jump with nums: \(nums)")

        guard nums.count > 1 else {
            print("Array too short, returning \(jumps)")
            return jumps
        }
        // [1, 2, 3]

        while i < nums.count {
            var j = 0
            var internalMax = 0

            print("At index \(i), value: \(nums[i])")
                        // 1,
            for j in 0...nums[i] {
                print("  Checking j = \(j), i + j = \(i + j)")
                internalMax = max(internalMax, nums[j])
                print("  internalMax now \(internalMax)")

                if (internalMax + i >= nums.count - 1) {
                    print("  Can reach end, returning \(jumps + 1)")
                    return jumps + 1
                }
            }

            if internalMax > 0 {
                jumps += 1
                i += internalMax
                print("Jumped to \(i), total jumps: \(jumps)")
            } else {
                print("Stuck at index \(i), returning \(jumps)")
                return jumps
            }
        }

        print("Finished loop, total jumps: \(jumps)")
        return jumps
    }
}

func firstTest() {
    let input = [2,3,1,1,4]
    let result = Solution45().jump(input)
    assert(result == 2, "test failed")
    print("✅ \(#function) passed")
}

func secondTest() {
    let input = [2,3,0,1,4]
    let result = Solution45().jump(input)
    assert(result == 2, "test failed")
    print("✅ \(#function) passed")
}

func thirdTest() {
    let input = [0]
    let result = Solution45().jump(input)
    assert(result == 0, "test failed")
    print("✅ \(#function) passed")
}

func fourthTest() {
    let input: [Int] = [1,2,1,1,1]
    let result = Solution45().jump(input)
    assert(result == 3, "test failed")
    print("✅ \(#function) passed")
}

func fifthTest() {
    let input: [Int] = [1,1,1,1,1]
    let result = Solution45().jump(input)
    assert(result == 4, "test failed")
    print("✅ \(#function) passed")
}

func sixthTest() {
    let input: [Int] = [1, 2, 3]
    let result = Solution45().jump(input)
    print("Expected: 2, Actual: \(result)")
    assert(result == 2, "test failed")
    print("✅ \(#function) passed")
}

func runAllTests() {
//    firstTest()
//    secondTest()
//    thirdTest()
//    fourthTest()
//    fifthTest()
    sixthTest()
}

runAllTests()
