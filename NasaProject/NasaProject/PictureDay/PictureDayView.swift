
import SwiftUI

struct PictureDayView: View {
//    @EnvironmentObject var viewModel: PictureDayViewModel
    @ObservedObject var viewModel: PictureDayViewModel
    
    init(viewModel: PictureDayViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    var body: some View {
        Text(viewModel.pictureDayModel?.day ?? "")
    }
}

//struct PictureDayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PictureDayView()
//    }
//}
