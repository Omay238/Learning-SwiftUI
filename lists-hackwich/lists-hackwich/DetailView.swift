//
//  DetailView.swift
//  lists-hackwich
//
//  Created by Omay Operations on 11/13/23.
//

import SwiftUI

struct DetailView: View {
    let selectedEmployee: Employee
    
    var body: some View {
        Text(selectedEmployee.firstName)
            .font(.largeTitle)
        Text(selectedEmployee.lastName)
            .font(.largeTitle)
        Text("\(selectedEmployee.uniqueID)")
        Text(selectedEmployee.department)
    }
}
