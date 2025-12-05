
/*
 
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 
 Notice that the solution set must not contain duplicate triplets.
 
 Example 1:
 
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation: 
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 
 Example 2:
 
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 
 Example 3:
 
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
 
 
 Constraints:
 
 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 
 */

class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var sortedNums: [Int] = nums.sorted()
        var result: [[Int]] = []
        guard nums.count >= 3 else { return result }
        
        var i: Int = 0
        
        while i < sortedNums.count - 2 {
            let iNumber = sortedNums[i]
            
            if iNumber > 0 {
                break
            }
            
            var leftPointer: Int = i + 1
            var rightPointer: Int = sortedNums.count - 1
            
            while leftPointer < rightPointer {
                let leftNumber = sortedNums[leftPointer]
                let rightNumber = sortedNums[rightPointer]
                let sum = iNumber + leftNumber + rightNumber
                
                if sum == 0 {
                    result.append([iNumber, leftNumber, rightNumber])
                    
                    while leftPointer < rightPointer && sortedNums[leftPointer] == leftNumber {
                        leftPointer += 1
                    }
                    
                    while leftPointer < rightPointer && sortedNums[rightPointer] == rightNumber {
                        rightPointer -= 1
                    }
                } else if sum > 0 && rightPointer > leftPointer {
                    while sortedNums[rightPointer] == rightNumber {
                        rightPointer -= 1
                    }
                } else {
                    while sortedNums[leftPointer] == leftNumber && leftPointer < rightPointer {
                        leftPointer += 1
                    }
                }
            }
            
            while i < sortedNums.count - 2 && sortedNums[i] == iNumber {
                i += 1
            }
        }
        
        return result
    }
}

func firstTestCase() {
    let input = [-1,0,1,2,-1,-4]
    let result = Solution15().threeSum(input)
    assert(result == [[-1,-1,2],[-1,0,1]], "test failed")
    print("✅ \(#function) passed")
}

func secondTestCase() {
    let input = [0,1,1]
    let result = Solution15().threeSum(input)
    assert(result == [], "test failed")
    print("✅ \(#function) passed")
}

func thirdTestCase() {
    let input = [0,0,0]
    let result = Solution15().threeSum(input)
    assert(result == [[0,0,0]], "test failed")
    print("✅ \(#function) passed")
    
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
    thirdTestCase()
} 

runAllTests()
