import SwiftUI

struct TabBarView: View {
    @State var selectedTab: Int = 2
    @ObservedObject var viewModel: PhotographsEarthViewModel
    @ObservedObject var pictureDayViewModel: PictureDayViewModel
    @ObservedObject var marsRoverPhotosViewModel: MarsRoverPhotosViewModel
    @ObservedObject var photoSelectMarsDateViewModel: PhotoSelectMarsDateViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PhotographsEarthView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            PictureDayView(viewModel: pictureDayViewModel)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)
            MarsRoverPhotosView(viewModel: marsRoverPhotosViewModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
            PhotoSelectOfMarsByDateView(viewModel: photoSelectMarsDateViewModel)
                .tabItem {
                    Image(systemName: "globe")
                    Text("Photo Mars")
                }
                .tag(3)
        }
        .accentColor(.red)
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(viewMode)
//    }
//}
