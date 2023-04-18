import SwiftUI

struct TabBarView: View {
    @State var selectedTab: Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            Text("Browse Tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            Text("Profile Tab")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct HomeView: View {
    var body: some View {
                    NavigationView {
//                        Color.red.ignoresSafeArea()
                        Text("Home Tab")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .navigationTitle("All")
                    .navigationBarTitleDisplayMode(.automatic)
    }
}
