
import SwiftUI

struct PictureDayView: View {
//    @EnvironmentObject var viewModel: PictureDayViewModel
    @ObservedObject var viewModel: PictureDayViewModel
    
    init(viewModel: PictureDayViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.pictureDayModel?.day ?? "")
                if #available(iOS 15.0, *) {
                    AsyncImage(
                        url: URL(string: viewModel.pictureDayModel?.url ?? ""),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1)
                                .cornerRadius(25)
                                
                            //                                        .frame(width: 300, height: 150)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                } else {
                    // Fallback on earlier versions
                }
                Text(viewModel.pictureDayModel?.title ?? "")
            }
        }
        .navigationTitle("Photo of the day")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

//struct PictureDayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureDayView()
//    }
//}
