import SwiftUI

struct ContentView: View {
    @State var word = ""
    @State var firstLetter = ""
    @State var lastLetter = ""
    @State var numberOfLetters = ""
    @State var isWordEmpty = ""
    @State var uppercased = ""
    
    @State var find = ""
    @State var replace = ""
    @State var stretch1Answer = ""
    
    @State var definiteArticle = ""
    @State var noun = ""
    @State var verb = ""
    @State var adverb = ""
    
    @State var pigLatinWord = ""
    
    var body: some View {
        VStack {
            Group {
                Divider()
                Text("Strings Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            TextField("Please enter a String", text: $word)
                .textFieldStyle(.roundedBorder)
            .padding()
            .onChange(of: word, perform: { value in
                //MARK: MVP 
                numberOfLetters = String(word.count)
                isWordEmpty = String(word.isEmpty)
                if let first = word.first {
                    firstLetter = "\(first)"
                } else {
                    firstLetter = " "
                }
                if let last = word.last {
                    lastLetter = "\(last)"
                } else {
                    lastLetter = " "
                }
                if word.isEmpty {
                    uppercased = " "
                } else {
                    uppercased = word.uppercased()
                }
            })
            Group {
                
                
                Text("MVP")
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .font(.title)
                    .underline()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Number of Letters: ")
                        Text("Is Word Empty: ")
                        Text("First Letter: ")
                        Text("Last Letter: ")
                        Text("All Uppercased: ")
                    }
                    
                    VStack(alignment: .leading)  {
                        Text(numberOfLetters)
                        Text(isWordEmpty)
                        Text(firstLetter)
                        Text(lastLetter)
                        Text(uppercased)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            Group {
                Text("Stretch #1")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .underline()
                Button("Test Stretch #1") {
                    //MARK: Stretch #1
                    stretch1Answer = word.replacingOccurrences(of: find, with: replace)
                }
                HStack {
                    Text("Replace: ")
                    TextField("letter", text: $find)
                        .autocorrectionDisabled(true)
                    Text(" With: ")
                    TextField("letter", text: $replace)
                        .autocorrectionDisabled(true)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                
                Text(stretch1Answer)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
            }
            
            
            Group {
                Text("Stretch #2")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .underline()
                Button("Test Stretch #2") {
                    //MARK: Stretch #2
                    let splits = word.split(separator: " ")
                    if splits.count >= 4 {
                        definiteArticle = String(splits[0])
                        noun = String(splits[1])
                        verb = String(splits[2])
                        adverb = String(splits[3])
                    }
                }
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Definite Article: ")
                        Text("Noun: ")
                        Text("Verb: ")
                        Text("Adverb: ")
                    }
                    
                    VStack(alignment: .leading)  {
                        Text(definiteArticle)
                        Text(noun)
                        Text(verb)
                        Text(adverb)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            
            
            Group {
                Text("Stretch #3")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .underline()
                Button("Test Stretch #3") {
                    //MARK: Stretch #3
                    pigLatinWord = convertSentenceToPigLatin(word)
                }
                
                Text(pigLatinWord)
                    .font(.title)
            }
            
            Spacer()
            Group {
                Image("MobileMakersEduNB")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
            }.padding()
        }
    }
    
    func convertToPigLatin(_ word: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        
        if let first = word.firstIndex(where: { vowels.contains($0) }) {
            let prefix = word[..<first]
            let suffix = word[first...]
            return String(suffix) + String(prefix) + "ay"
        }
        
        return word + "ay"
    }
    
    func convertSentenceToPigLatin(_ sentence: String) -> String {
        let wordsWithPunctuation = sentence.components(separatedBy: .whitespacesAndNewlines)
        
        let pigLatinWords = wordsWithPunctuation.map { word -> String in
            let punctuation = word.trimmingCharacters(in: .alphanumerics)
            let cleanedWord = word.trimmingCharacters(in: .punctuationCharacters)
            let pigLatinWord = convertToPigLatin(cleanedWord)
            return pigLatinWord + punctuation
        }
        
        return pigLatinWords.joined(separator: " ")
    }
}
