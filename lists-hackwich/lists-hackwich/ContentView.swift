//
//  ContentView.swift
//  lists-hackwich
//
//  Created by Omay Operations on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var fruits: [String] = ["Apple", "Raspberry", "Peach", "Banana"]
    let employees = [
        Employee(uniqueID: 123456, firstName: "Minnie", lastName: "Mouse", department: "Human Resources"),
        Employee(uniqueID: 987654, firstName: "Donald", lastName: "Duck", department: "Engineering"),
        Employee(uniqueID: 234987, firstName: "Harry", lastName: "Potter", department: "Sales")
    ]
    let employeeGroups = [
        EmployeeGroup(id: 0, groupName: "Managers", employees: [
            Employee(uniqueID: 0, firstName: "Bruce", lastName: "Wayne", department: "Accounting"),
            Employee(uniqueID: 1, firstName: "Lois", lastName: "Lane", department: "Marketing"),
            Employee(uniqueID: 2, firstName: "Minnie", lastName: "Mouse", department: "Human Resources"),
            Employee(uniqueID: 3, firstName: "Mickey", lastName: "Mouse", department: "Sales")
        ]),
        EmployeeGroup(id: 1, groupName: "Administrators", employees: [
            Employee(uniqueID: 4, firstName: "Peter", lastName: "Parker", department: "Marketing"),
            Employee(uniqueID: 5, firstName: "Tony", lastName: "Stark", department: "Accounting"),
            Employee(uniqueID: 6, firstName: "Steve", lastName: "Rogers", department: "Sales"),
            Employee(uniqueID: 7, firstName: "Clark", lastName: "Kent", department: "Engineering")
        ]),
        EmployeeGroup(id: 2, groupName: "Aides", employees: [
            Employee(uniqueID: 8, firstName: "Barry", lastName: "Allen", department: "Shipping"),
            Employee(uniqueID: 9, firstName: "Scott", lastName: "Summers", department: "Quality Assurance"),
            Employee(uniqueID: 10, firstName: "Logan", lastName: "Howlett", department: "Engineering"),
            Employee(uniqueID: 11, firstName: "Hal", lastName: "Jordan", department: "Marketing")
        ])
    ]
    @State var movies: [String] = []
    @State var enteredMovie: String = ""
    var body: some View {
//        List {
//            ForEach(1...5, id: \.self) { number in
//                Text("To Do #\(number)")
//            }
//        }
        
        //For each loop iterating through array
//        List {
//            ForEach(0..<fruits.count, id: \.self) { index in
//                Text(fruits[index])
//            }
//        }
        
        //For each loop iterating through array using each item
//        List(fruits, id: \.self) { fruit in
//            Text(fruit)
//        }
        //Adding dynamic data from a struct
//        List(employees, id: \.uniqueID) { employee in
//            Text(employee.firstName + " " + employee.lastName)
//        }
        
//        TextField("Enter a movie", text: $enteredMovie)
//            .textFieldStyle(.roundedBorder)
//            .padding()
//            .onSubmit {
//                movies.append(enteredMovie)
//                enteredMovie = ""
//            }
//        List(movies, id: \.self) { movie in
//            Text(movie)
//        }
        
//        List {
//            ForEach(employeeGroups, id: \.id) { employeeGroup in
//                Section(header: Text(employeeGroup.groupName)) {
//                    ForEach(employeeGroup.employees, id: \.uniqueID) { employee in
//                        Text(employee.firstName + " " + employee.lastName)
//                    }
//                }
//            }
//        }
        
        NavigationView {
            List {
                        ForEach(employeeGroups, id: \.id) { employeeGroup in
                            Section(header: Text(employeeGroup.groupName)) {
                                ForEach(employeeGroup.employees, id: \.uniqueID) { employee in
                                    NavigationLink(employee.firstName + " " + employee.lastName) {
                                        DetailView(selectedEmployee: employee)
                                    }
                                }
                            }
                        }
                    }
        }
    }
}

#Preview {
    ContentView()
}
