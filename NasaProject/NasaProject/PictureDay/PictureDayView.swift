import SwiftUI

struct PictureDayView: View {
    @ObservedObject var viewModel: PictureDayViewModel
    
    init(viewModel: PictureDayViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(viewModel.pictureDayModel?.day ?? "")
                    Spacer()
                    if #available(iOS 15.0, *) {
                        AsyncImage(
                            url: URL(string: viewModel.pictureDayModel?.url ?? ""),
                                    content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .layoutPriority(-1)
                                    .cornerRadius(25)
                                    .padding(.horizontal)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    } else {
                        // Fallback on earlier versions
                    }
                    Text(viewModel.pictureDayModel?.title ?? "")
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Photo of the day")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

//struct PictureDayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureDayView()
//    }
//}
