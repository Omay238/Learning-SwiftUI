import SwiftUI

struct RedView: View {
    var body: some View {
        
        VStack {
            Text("Red View")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        
        //MARK: MVP - Part VI
        
        NavigationView(content: {
            NavigationLink(destination: YellowView(), label: {
                Text("Go to the yellow view")
            })
        })
        
        
    }
}

