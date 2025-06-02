import Foundation

/*
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

 Merge nums1 and nums2 into a single array sorted in non-decreasing order.

 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.



 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 Example 2:

 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].
 Example 3:

 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.


 Constraints:

 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[j] <= 109


 Follow up: Can you come up with an algorithm that runs in O(m + n) time?
 */

class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var totalIndex = m + n - 1
        var leftIndex = m - 1
        var rightIndex = n-1
        print("Input: nums1: \(nums1), m: \(m), nums2: \(nums2), n: \(n)")
        print("\n-------------------------------------------------------")

        guard n != 0 else { return }

        while (rightIndex >= 0) {

            if leftIndex >= 0 && (nums1[leftIndex] > nums2[rightIndex]) {
                nums1[totalIndex] = nums1[leftIndex]
                leftIndex -= 1
            } else {
                nums1[totalIndex] = nums2[rightIndex]
                rightIndex -= 1
            }

            totalIndex -= 1
        }
        print("\n-------------------------------------------------------")
    }
}

func testIfBothArrayIsEmpty() {
    var input1: [Int] = []
    var input2: [Int] = []
    Solution88().merge(&input1, 0, input2, 0)
    assert(input1 == [], "Test "+#function+" failed\n")
    print("Test "+#function+"passed\n")
}

func testRegularInput() {
    var input1 = [1,2,3,0,0,0]
    var input2 = [2,5,6]
    let countFirst = 3
    let countSecond = 3
    Solution88().merge(&input1, countFirst, input2, countSecond)
    assert(input1 == [1,2,2,3,5,6], "Test "+#function+" failed\n")
    print("Test "+#function+" passed\n")
}

func testExtraInput() {
    var input1 = [0]
    var input2 = [1]
    let countFirst = 0
    let countSecond = 1
    Solution88().merge(&input1, countFirst, input2, countSecond)
    print(input1)
    assert(input1 == [1], "Test "+#function+" failed\n")
    print("Test "+#function+" passed\n")
}

func testSexondExtraInput() {
    var input1 = [2,0]
    var input2 = [1]
    let countFirst = 1
    let countSecond = 1
    Solution88().merge(&input1, countFirst, input2, countSecond)
    print(input1)
    assert(input1 == [1,2], "Test "+#function+" failed\n")
    print("Test "+#function+" passed\n")
}

func runAllTests() {
    testIfBothArrayIsEmpty()
    testRegularInput()
    testExtraInput()
    testSexondExtraInput()
    print("All tests passed.")
}

runAllTests()
