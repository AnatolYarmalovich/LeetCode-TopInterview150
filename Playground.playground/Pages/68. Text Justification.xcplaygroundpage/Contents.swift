import Foundation

/*
 Given an array of strings words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
 
 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
 
 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
 
 For the last line of text, it should be left-justified, and no extra space is inserted between words.
 
 Note:
 
 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.
 
 
 Example 1:
 
 Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
 Output:
 [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]
 Example 2:
 
 Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
 Output:
 [
 "What   must   be",
 "acknowledgment  ",
 "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
 Note that the second line is also left-justified because it contains only one word.
 Example 3:
 
 Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
 Output:
 [
 "Science  is  what we",
 "understand      well",
 "enough to explain to",
 "a  computer.  Art is",
 "everything  else  we",
 "do                  "
 ]
 
 
 Constraints:
 
 1 <= words.length <= 300
 1 <= words[i].length <= 20
 words[i] consists of only English letters and symbols.
 1 <= maxWidth <= 100
 words[i].length <= maxWidth
 
 */

class Solution68 {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var sortedByLines: [[String]] = []
        var currentLine: [String] = []
        var result: [String] = []
        var currentLength: Int = 0
        
        for word in words {
            let needed = currentLength == 0 ? word.count : currentLength + 1 + word.count 
            if needed <= maxWidth {
                currentLine.append(word)
                currentLength = needed
            } else {
                sortedByLines.append(currentLine)
                
                currentLine = [word]
                currentLength = word.count
            }
        }
        
        if currentLine.isEmpty == false {
            sortedByLines.append(currentLine)
        }
        
        for (index, line) in sortedByLines.enumerated() {
            let slots: Int = line.count - 1
            
            var lineStr = ""
            
            var totalCharacterCount: Int = 0
            for word in line {
                totalCharacterCount += word.count
            }
            let spacedNeeded: Int = maxWidth - totalCharacterCount
            
            if index == sortedByLines.count - 1 || slots == 0 {
                for word in line {
                    if lineStr.isEmpty {
                        lineStr += word 
                    } else {
                        lineStr += " "
                        lineStr += word
                    }
                }
                while lineStr.count < maxWidth {
                    lineStr += " "
                }
                result.append(lineStr)
            } else {
                let base = spacedNeeded / slots
                let extra = spacedNeeded % slots
                
                for i in 0..<line.count {
                    lineStr += line[i]
                    if i < line.count - 1 {
                        let toAdd = base + (i < extra ? 1 : 0)
                        var counter: Int = 0
                        while counter < toAdd {
                            lineStr += " "
                            counter += 1
                        }
                    }
                }
                result.append(lineStr)
            }
        }
        
        return result
    }
}


func firstTest()  {
    let words: [String] = ["This", "is", "an", "example", "of", "text", "justification."]
    let maxWidth: Int = 16
    let result = Solution68().fullJustify(words, maxWidth)
    assert(result == [
        "This    is    an",
        "example  of text",
        "justification.  "
    ], "test failed")
    print("✅ \(#function) passed")
}

func secondTest()  {
    let words: [String] = ["What","must","be","acknowledgment","shall","be"]
    let maxWidth: Int = 16
    let result = Solution68().fullJustify(words, maxWidth)
    assert(result == [
        "What   must   be",
        "acknowledgment  ",
        "shall be        "
    ], "test failed")
    print("✅ \(#function) passed")
}

func thirdTest() {
    let words: [String] = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"]
    let maxWidth: Int = 20
    let result = Solution68().fullJustify(words, maxWidth)
    assert(result == [
        "Science  is  what we",
        "understand      well",
        "enough to explain to",
        "a  computer.  Art is",
        "everything  else  we",
        "do                  "
    ], "test failed")
    print("✅ \(#function) passed")
}

func runAllTests()  {
    firstTest()
    secondTest()
    thirdTest()
}

runAllTests()
