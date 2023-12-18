import SwiftUI

struct ContentView: View {
    
    @State var index: Int?
    @State var removedMovie: String = "Removed Movie"
    
    // MARK: MVP - Part I
    
    @State var myFavoriteMovies = ["Evil Dead", "The Matrix", "Maze Runner"]
    @State var myMovieRatings = ["Evil Dead": 4, "The Matrix": 5, "Maze Runner": 4.5]
    
    
    var body: some View {
        
        Group {
            Divider()
            Text("Collections Challenge")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title)
            Divider()
        }
        
        //MARK: MVP - Part II
        
        Text("\(myFavoriteMovies.count) Movies")
            .font(.title3)
        
        List { 
            
            Section {
                //TODO: MVP - Part I
                ForEach(0..<myFavoriteMovies.count, id: \.self) { value in
                    Text(myFavoriteMovies[value])
                }
            } header: {
                Text("Array")
            }
            
            Section {
                //TODO: MVP - Part II
                ForEach(myMovieRatings.sorted(by: >), id: \.key) { key, count in
                    HStack {
                        Text(key)
                        ForEach(0..<Int(count), id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        
                        if count != Double(Int(count)) {
                            Image(systemName: "star.leadinghalf.fill")
                                .foregroundColor(.yellow)
                        } else if Int(count) < 5 {
                            Image(systemName: "star")
                                .foregroundColor(.yellow)
                        }
                        if Int(count) < 5 {
                            ForEach(0..<(4 - Int(count)), id: \.self) { _ in
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }            
            } header: {
                Text("Dictionary")
            }
        }
        VStack(spacing: 10) {
            Button(action: {
                //MARK: Stretch #1
                myFavoriteMovies.append("Tron Legacy")
                myMovieRatings.updateValue(4.5, forKey: "Tron Legacy")
            }, label: {
                Text("Stretch #1")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(Capsule())
            })
            
            Button(action: {
                //MARK: Stretch #2
                myFavoriteMovies.insert("Tetris Movie", at: 0)
                myMovieRatings.updateValue(4, forKey: "Tetris Movie")
            }, label: {
                Text("Stretch #2")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(Capsule())
            })
            
            Button(action: {
                //MARK: Stretch #3
                if let ind: Int = index {
                    if ind >= myFavoriteMovies.count {
                        print("out of bounds index: \(String(describing: ind))")
                    } else {
                        myMovieRatings.removeValue(forKey: myFavoriteMovies[ind])
                        myFavoriteMovies.remove(at: ind)
                    }
                } else {
                    print("invalid index: \(String(describing: index))")
                }
            }, label: {
                Text("Stretch #3")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.gray)
                    .clipShape(Capsule())
                
            })
            
        }
        .padding()
        
        HStack {
            TextField("Enter Index #", value: $index, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: .infinity)
            
            Text(removedMovie)
                .frame(maxWidth: .infinity)
        }
        .padding()
        
        Group {
            Image("MobileMakersEduNB")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
        }
        .padding()
    }
}
