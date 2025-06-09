import SwiftUI

@main
struct eshopApp: App {
    var body: some Scene {
        WindowGroup {
            TabView
            {
                CatList()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Shopping")
                    }
                CatList()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorite")
                    }.badge(5)
                
                Text("Cart")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .badge(1)
                
                Profile()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
        }
    }
}
