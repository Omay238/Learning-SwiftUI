import SwiftUI

struct ContentView: View {
    @State var sliderValue = 2.0
    @State var output: String = ""
    var body: some View {
        
        VStack {
            
            Group {
                Divider()
                Text("Functions Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            Text("Slider Position: \(Int(sliderValue))")
            Slider(value: $sliderValue, in: 0...6) {
                Text("Slider")
            } minimumValueLabel: {
                Text("MVP").font(.title2).fontWeight(.thin)
            } maximumValueLabel: {
                Text("Stretch #6").font(.title2).fontWeight(.thin)
            }
            .tint(.blue)
            .padding()
            .onChange(of: sliderValue) { _ in
                switch(Int(sliderValue)){
                case 0:
                    //MARK: MVP - Part II
                    displayMVP()
                    
                    
                    break
                case 1:
                    //MARK: Stretch #1 - Part II
                    output = returnAString()
                    
                    
                    break
                case 2:
                    //MARK: Stretch #2 - Part II
                    output = createSentence(favoriteClass: "Math")
                    
                    
                    
                    break
                case 3:
                    // TODO: - Stretch #3
                    output = createFruitLovingSentence("apples", And: "bananas")
                    break
                case 4:
                    let sentence = "Programming Rules"
                    // TODO: - Stretch #4
                    output = "\"\(sentence)\"\n has \(countTheCharacters(sentence)) characters"
                    break
                case 5:
                    let sentence = "Here is my sentence"
                    // TODO: - Stretch #5
                    let tuple = findVowelsConsonants(sentence)
                    output = "\"" + sentence + "\"\n" + "Vowels:\(tuple.0) Consonants:\(tuple.1)"
                    break
                default:
                    let anotherSentence = "My Other Sentence"
                    // TODO: - Stretch #6
                    let tuple = findVowelsConsonantsPunctuation(anotherSentence)
                    output = "\"" + anotherSentence + "\"\nVowels:\(tuple.0) \nConsonants:\(tuple.1) \nPunctuation:\(tuple.2)"
                    break
                }
            }
            
            Text(output)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            Group {
                
                Image("MobileMakersEduNB")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                
            }
            .padding()
        }
    }
        
    
    //MARK: - MVP - Part I
    func displayMVP() {
        output = "MVP Completed"
    }
    
    
    
    //MARK: - Stretch #1 - Part I
    func returnAString() -> String {
        return "Stretch #1 Complete"
    }
    
    
    
    //MARK: - Stretch #2 - Part I
    func createSentence(favoriteClass: String) -> String {
        return "I love \(favoriteClass) class!"
    }
    
    
    
    //MARK: - Stretch #3
    func createFruitLovingSentence(_ fruit1: String, And fruit2: String) -> String {
        return "I love both \(fruit1) and \(fruit2). They're both great."
    }
    
    
    
    //MARK: - Stretch #4
    func countTheCharacters(_ sentence: String) -> Int {
        return sentence.count
    }
    
    
    
    //MARK: - Stretch #5
    func findVowelsConsonants(_ sentence: String) -> (Int, Int) {
        let consonants = "bcdfghjklmnpqrstvwxz"
        let vowels = "aeiouy"
        var numConsonants = 0
        var numVowels = 0
        for i in sentence.lowercased() {
            if consonants.contains(i) {
                numConsonants += 1
            } else if vowels.contains(i) {
                numVowels += 1
            }
        }
        return (numVowels, numConsonants)
    }
    
    
    
    //MARK: - Stretch #6
    func findVowelsConsonantsPunctuation(_ sentence: String) -> (Int, Int, Int) {
        let consonants = "bcdfghjklmnpqrstvwxz"
        let vowels = "aeiouy"
        let punctuation = "`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/? "
        var numConsonants = 0
        var numVowels = 0
        var numPunctuation = 0
        for i in sentence.lowercased() {
            if consonants.contains(i) {
                numConsonants += 1
            } else if vowels.contains(i) {
                numVowels += 1
            } else if punctuation.contains(i) {
                numPunctuation += 1
            }
        }
        return (numVowels, numConsonants, numPunctuation)
    }
    
    
    
}
