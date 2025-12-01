
/*
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 
 Given a string s, return true if it is a palindrome, or false otherwise.
 
 Example 1:
 
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:
 
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:
 
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 
 
 Constraints:
 
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 
 */

class Solution125 {
    func isPalindrome(_ s: String) -> Bool {
        var leading: Int = 0
        var trailing: Int = s.count - 1
        var characters: [Character] = Array(s)
        while leading < trailing {
            let leftChar = characters[leading]
            let rightChar = characters[trailing]
            if !leftChar.isLetter && !leftChar.isNumber {
                leading += 1  
                continue
            } 
            
            if !rightChar.isLetter && !rightChar.isNumber {
                trailing -= 1
                continue
            }
            
            if leftChar.lowercased() != rightChar.lowercased() {
                return false 
            } 
            
            trailing -= 1
            leading += 1  
        }  
        return true
    }
}

func firstTestCase() {
    let input: String = "A man, a plan, a canal: Panama"
    let result = Solution125().isPalindrome(input)
    assert(result == true, "test failed")
    print("✅ \(#function) passed")
}

func secondTestCase() {
    let input: String = "race a car"
    let result = Solution125().isPalindrome(input)
    assert(result == false, "test failed")
    print("✅ \(#function) passed")
}

func thirdTestCase() {
    let input: String = " "
    let result = Solution125().isPalindrome(input)
    assert(result == true, "test failed")
    print("✅ \(#function) passed")
}

func runAllTests() {
    firstTestCase()
    secondTestCase()
    thirdTestCase()
}

runAllTests()
