
/*
 
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.

 Example 1:
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 
 Example 2:
 Input: height = [1,1]
 Output: 1
  

 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 
 */


class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var leading: Int = 0
        var trailing: Int = height.count - 1
        var result: Int = 0

        while leading < trailing {
            let leftValue: Int = height[leading]
            let rightValue: Int = height[trailing]
            let best = min(leftValue, rightValue) * (trailing - leading)
            
            if leftValue <= rightValue {
                leading += 1
            } else {
                trailing -= 1
            }
            
            if result < best {
                result = best
            }
        }

        return result
    }
}

func firstTestCase() {
    let inputHeight: [Int] = [1,8,6,2,5,4,8,3,7] 
    let result = Solution11().maxArea(inputHeight)
    assert(result == 49, "test failed")
    print("✅ \(#function) passed")
}

func secondTestCase() {
    let inputHeight: [Int] = [1,1] 
    let result = Solution11().maxArea(inputHeight)
    assert(result == 1, "test failed")
    print("✅ \(#function) passed")
}

func runAllTestCases() {
    firstTestCase()
    secondTestCase()
}

runAllTestCases()
