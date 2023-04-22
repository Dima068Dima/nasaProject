import SwiftUI

struct PhotographsEarthView: View {
    @ObservedObject var viewModel: PhotographsEarthViewModel
    
    init(viewModel: PhotographsEarthViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<viewModel.photographsEarthModel.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(width: 300, height: 150)
                        .shadow(radius: 10)
                        .padding()
                    Text("")
                }
            }
        }
    }
}

//struct PhotographsEarthView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotographsEarthView(viewModel: <#PhotographsEarthViewModel#>)
//    }
//}
