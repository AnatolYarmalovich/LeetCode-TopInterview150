
/*
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  

 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false
  

 Constraints:

 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.
 */

class Solution392 {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.isEmpty == false else { return true }
        
        var inputChars: [Character] = Array(s)
        var pointer: Int = 0
        
        for char in t {
            if inputChars[pointer] == char {
                pointer += 1
                if pointer == inputChars.count {
                    return true
                }
            }
        }
        
        return false
    }
}

func firstTestCase() {
    let inputS: String = "abc"
    let inputT: String = "ahbgdc"
    let result = Solution392().isSubsequence(inputS, inputT)
    assert(result == true, "test failed")
    print("✅ \(#function) passed")
}

func secondTestCase() {
    let inputS: String = "axc"
    let inputT: String = "ahbgdc"
    let result = Solution392().isSubsequence(inputS, inputT)
    assert(result == false, "test failed")
    print("✅ \(#function) passed")
}

func thirdTestCase() {
    let inputS: String = ""
    let inputT: String = "ahbgdc"
    let result = Solution392().isSubsequence(inputS, inputT)
    assert(result == true, "test failed")
    print("✅ \(#function) passed")
}

func fourthTestCase() {
    let inputS: String = "acb"
    let inputT: String = "ahbgdc"
    let result = Solution392().isSubsequence(inputS, inputT)
    assert(result == false, "test failed")
    print("✅ \(#function) passed")
}

func fifthTestCase() {
    let inputS: String = "b"
    let inputT: String = "c"
    let result = Solution392().isSubsequence(inputS, inputT)
    assert(result == false, "test failed")
    print("✅ \(#function) passed")
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
    thirdTestCase()
    fourthTestCase()
    fifthTestCase()
}

runAllTests()
