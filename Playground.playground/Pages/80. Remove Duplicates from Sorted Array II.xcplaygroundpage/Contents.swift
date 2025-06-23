import Foundation

/*

Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

Return k after placing the final result in the first k slots of nums.

Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.



 Example 1:

 Input: nums = [1,1,1,2,2,3]
 Output: 5, nums = [1,1,2,2,3,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:

 Input: nums = [0,0,1,1,1,1,2,3,3]
 Output: 7, nums = [0,0,1,1,2,3,3,_,_]
 Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).


 Constraints:

 1 <= nums.length <= 3 * 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.

 */

class Solution80 {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        var result = nums.count
//        var equalLimit: Int = 2
//        var i: Int = 0
//
//        while i != result - 1 {
//            if result - 1 == i {
//                return result
//            }
//
//            let currentValue = nums[i]
//            let nextValue = nums[i+1]
//
//            if currentValue == nextValue {
//                equalLimit -= 1
//                if equalLimit <= 0 {
//                    nums.append(currentValue)
//                    nums.remove(at: i)
//                    result -= 1
//                    continue
//                }
//            } else {
//                equalLimit = 2
//            }
//            i += 1
//        }
//        return result
//    }

    func removeDuplicates(_ nums: inout [Int]) -> Int {
            var count = 0
            var current = 1

        for i in 1...nums.count - 1 {
                if nums[i] != nums[i - 1] {
                    count = 0
                    nums[current] = nums[i]
                    current += 1
                } else {
                    count += 1
                    if count <= 1 {
                        nums[current] = nums[i]
                        current += 1
                    }
                }
            }
            return current
        }
}

func testMyCode80() {
    func firstTest() {
        print("\n➡️ Running \(#function)")
        var input: [Int] = []
        print("Input: \(input)")

        let result = Solution80().removeDuplicates(&input)
        print("Result: \(result)")
        print("Modified input: \(input)")

        assert(result == 5, "❌ Returned value not correct: \(result)")
        assert(input == [1,1,2,2,3,3], "❌ Array contents not correct: \(input.prefix(result))")

        print("✅ \(#function) passed")
    }

    func secondTest() {
        print("\n➡️ Running \(#function)")
        var input = [0,0,1,1,1,1,2,3,3]
        print("Input: \(input)")

        let result = Solution80().removeDuplicates(&input)
        print("Result: \(result)")
        print("Modified input: \(input)")

        assert(result == 7, "❌ Returned value not correct: \(result)")
        assert(input == [0,0,1,1,2,3,3, 3, 3], "❌ Array contents not correct: \(input.prefix(result))")

        print("✅ \(#function) passed")
    }


    firstTest()
    secondTest()
}

testMyCode80()
