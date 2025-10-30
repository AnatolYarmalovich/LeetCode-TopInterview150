
import Foundation


/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 
 Write the code that will take a string and make this conversion given a number of rows:
 
 string convert(string s, int numRows);
 
 
 Example 1:
 
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:
 
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:
 
 Input: s = "A", numRows = 1
 Output: "A"
 
 
 Constraints:
 
 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 */

class Solution6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || s.count <= numRows { return s }
        var rows = Array(repeating: "", count: numRows)
        var currentRow: Int = 0
        var topDirection: Bool = false
        
        for char in s {
                        
            rows[currentRow].append(char)
            
            if currentRow == numRows - 1 || currentRow == 0 {
                topDirection.toggle()
                
            } 
            currentRow += topDirection ? 1 : -1
        }
        
        
        return rows.joined()
    }
}

func firstTest()  {
    let inputString: String = "PAYPALISHIRING"
    let rowsNumber: Int = 3
    let result = Solution6().convert(inputString, rowsNumber)
    assert(result == "PAHNAPLSIIGYIR", "test failed")
    print("✅ \(#function) passed")
}

func secondTest()  {
    let inputString: String = "PAYPALISHIRING"
    let rowsNumber: Int = 4
    let result = Solution6().convert(inputString, rowsNumber)
    assert(result == "PINALSIGYAHRPI", "test failed")
    print("✅ \(#function) passed")
}

func runAllTests()  {
    firstTest()
    secondTest()
}

runAllTests()
