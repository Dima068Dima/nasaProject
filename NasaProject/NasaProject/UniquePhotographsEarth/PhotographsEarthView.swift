import SwiftUI

struct PhotographsEarthView: View {
    @ObservedObject var viewModel: PhotographsEarthViewModel
    
    init(viewModel: PhotographsEarthViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.photographsEarthModel) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.white)
                                .frame(width: 300, height: 150)
                                .shadow(radius: 10)
                                .padding()
                            if #available(iOS 15.0, *) {
                                AsyncImage(
                                    url: URL(string: "\(index.image)"),
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
                            
                        }
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        
                    }
                }
            }
            .navigationTitle("Photo")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

//struct PhotographsEarthView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotographsEarthView(viewModel: <#PhotographsEarthViewModel#>)
//    }
//}
