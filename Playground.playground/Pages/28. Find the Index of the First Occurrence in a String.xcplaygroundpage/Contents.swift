import Foundation

/*
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 
 
 Example 1:
 
 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:
 
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
 
 
 Constraints:
 
 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 
 */

class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if needle.count > haystack.count { return -1 }
        
        
        for index in haystack.indices {
            let remaining = haystack.distance(from: index, to: haystack.endIndex)
            if remaining < needle.count {
                break
            }
            
            let end = haystack.index(index, offsetBy: needle.count)
            let substring = haystack[index..<end]
            
            if substring == needle {
                return haystack.distance(from: haystack.startIndex, to: index)
            }
        }
        
        return -1
    }
}

func firstTest()  {
    let haystack: String = "sadbutsad"
    let needle: String = "sad"
    let result = Solution28().strStr(haystack, needle)
    assert(result == 0, "test failed")
    print("✅ \(#function) passed")
}

func secondTest()  {
    let haystack: String = "leetcode"
    let needle: String = "leeto"
    let result = Solution28().strStr(haystack, needle)
    assert(result == -1, "test failed")
    print("✅ \(#function) passed")
}

func runAllTests()  {
    firstTest()
    secondTest()
}

runAllTests() 
