import SwiftUI

struct ContentView: View {
    
    @State var firstNameTextField: String = ""
    @State var lastNameTextField: String = ""
    @State var idNumberTextField: String = ""
    @State var favoriteColorTextField: String = ""
    
    @State var selectedValue = 0
    
    var body: some View {
        VStack {
            Group {
                Divider()
                Text("Classes Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            HStack {
                Text("First Name:")
                TextField("Enter First Name Here", text: $firstNameTextField)
            }
            HStack {
                Text("Last Name:")
                TextField("Enter Last Name Here", text: $lastNameTextField)
            }
            HStack {
                Text("ID Number:")
                TextField("Enter ID Number Here", text: $idNumberTextField)
            }
            HStack {
                Text("Favorite Color:")
                TextField("Enter Favorite Color Here", text: $favoriteColorTextField)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        
        Divider()
        
        Picker(selection: $selectedValue, label: Text("Hello")) {
            Text("MVP").tag(0)
            Text("Stretch #1").tag(1)
            Text("Stretch #2").tag(2)
            Text("Stretch #3").tag(3)
        }
        .pickerStyle(.wheel)
        
        Divider()
        
        if selectedValue == 1 {
            Text(Stretch1())
        } else if selectedValue == 2 {
            Text(Stretch2())
        } else if selectedValue == 3 {
            Text(Stretch3())
        } else {
            Text(MVP())
        }
        
        Spacer()
        Group {
            Image("MobileMakersEduNB")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
        }
        .padding()
    }
    
    func MVP() -> String {
        var mvpFirstName: String = ""
        var mvpLastName: String = ""
        
        //MARK: MVP - Part II
        let student = Student()
        
        mvpFirstName = student.firstName
        mvpLastName = student.lastName
        
        return "\(mvpFirstName) \(mvpLastName)"
    }
    
    
    func Stretch1() -> String {
        var stretch1FirstName: String = ""
        var stretch1LastName: String = ""
        var stretch1IdNumber:String = ""
        var stretch1FavoriteColor: String = ""
        
        //MARK: Stretch #1 - Part II
        let student = Student()
        
        stretch1FirstName = student.firstName
        stretch1LastName = student.lastName
        stretch1IdNumber = student.idNumber
        stretch1FavoriteColor = student.favoriteColor
        
        return "\(stretch1FirstName) \(stretch1LastName)\n\(stretch1IdNumber)\n\(stretch1FavoriteColor)"
    }
    
    func Stretch2() -> String {
        var stretch2FirstName: String = ""
        var stretch2LastName: String = ""
        var stretch2IdNumber:String = ""
        var stretch2FavoriteColor: String = ""
        
        //MARK: Stretch #2 - Part II
        let student = Student(firstName: firstNameTextField, lastName: lastNameTextField, idNumber: idNumberTextField, favoriteColor: favoriteColorTextField)
        
        stretch2FirstName = student.firstName
        stretch2LastName = student.lastName
        stretch2IdNumber = student.idNumber
        stretch2FavoriteColor = student.favoriteColor
        
        return "\(stretch2FirstName) \(stretch2LastName)\n\(stretch2IdNumber)\n\(stretch2FavoriteColor)"
    }
    
    func Stretch3() -> String {
        
        var message = ""
        
        //MARK: Stretch #3 - Part II
        let student = Student()
        
        message = student.sayHello()
        
        return message
    }
}

