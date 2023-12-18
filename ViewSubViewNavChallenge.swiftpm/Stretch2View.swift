import SwiftUI

struct Stretch2View: View {
    var body: some View {
        //MARK: Stretch #2
        NavigationView(content: {
            VStack {
                NavigationLink(destination: ImageView1(), label: {
                    Image(systemName: "1.lane")
                })
                NavigationLink(destination: ImageView2(), label: {
                    Image(systemName: "2.lane")
                })
            }
        })
        
        
    }
}
