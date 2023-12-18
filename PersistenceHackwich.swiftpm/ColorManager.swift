import SwiftUI

struct ColorManager {
    func getColors() -> [MyColor] {
        if let object = UserDefaults.standard.value(forKey: "colors") as? Data {
            if let objectDecoded = try? JSONDecoder().decode(Array.self, from: object) as [MyColor] {
                return objectDecoded
            }
        } else {
            print("Decoding Failed")
        }
        return [MyColor]()
    }
    
    func setColors(colors: [MyColor]) {
        if let encoded = try? JSONEncoder().encode(colors) {
            UserDefaults.standard.set(encoded, forKey: "colors")
        } else {
            print("Encoding Failed")
        }
    }
}
