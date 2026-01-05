import Foundation

/*
 Given a string s, find the length of the longest substring without duplicate characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var left = 0
        var right = 0
        var set = Set<Character>()
        var result = 0
        
        while right < chars.count {
            let currentChar = chars[right]
            
            if set.contains(currentChar) {
                set.remove(chars[left])
                left += 1
            } else {
                set.insert(currentChar)
                result = max(result, right - left + 1)
                right += 1
            }
        }
        
        return result
    }
}


func firstTestCase() {
    let input = "abcabcbb"
    let result = Solution3().lengthOfLongestSubstring(input)
    assert(result == 3, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func secondTestCase() {
    let input = "bbbbb"
    let result = Solution3().lengthOfLongestSubstring(input)
    assert(result == 1, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func thirdTestCase() {
    let input = "pwwkew"
    let result = Solution3().lengthOfLongestSubstring(input)
    assert(result == 3, "Test case failed: \(#function)")
    print("✅ Test case succeeded: \(#function)")
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
    thirdTestCase()
}

runAllTests()
