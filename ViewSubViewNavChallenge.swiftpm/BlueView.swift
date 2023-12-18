import SwiftUI

struct BlueView: View {
    var body: some View {
        VStack {
            //MARK: MVP - Part I
            Text("Blue View")
            
            
        }
        //MARK: MVP - Part II
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        
        
        
        
        //MARK: MVP - Part IV
        
        GreenView()
        
        
    }
}

//MARK: MVP - Part III

struct GreenView: View {
    var body: some View {
        Text("Green View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
    }
}

