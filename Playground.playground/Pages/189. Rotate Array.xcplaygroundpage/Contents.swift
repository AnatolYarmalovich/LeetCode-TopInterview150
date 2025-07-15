import Foundation

class Solution189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k != 0 else {
            return
        }

        var tempValue = nums[nums.count - 1]

        var index: Int = 0
        let limit = nums.count - k - 1

        while index < nums.count {
            let currentValue = nums[index]

            nums[index] = tempValue
            tempValue = currentValue

            index += 1
        }

        rotate(&nums, k - 1)
    }
}

func firstTestCase() {
    var nums = [1,2,3,4,5,6,7]
    let k = 3
    Solution189().rotate(&nums, k)
    assert(nums == [5,6,7,1,2,3,4], "test failed")
    print("✅ \(#function) passed")
}

func secondTestCase() {
    var nums = [-1,-100,3,99]
    let k = 2
    Solution189().rotate(&nums, k)
    assert(nums == [3,99,-1,-100], "test failed")
    print("✅ \(#function) passed")
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
}

runAllTests()
