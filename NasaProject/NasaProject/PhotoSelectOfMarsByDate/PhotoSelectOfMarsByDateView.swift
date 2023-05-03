import SwiftUI

struct PhotoSelectOfMarsByDateView: View {
    @State var selectedDate: Date = Date()
    @ObservedObject var viewModel: PhotoSelectMarsDateViewModel
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(CompactDatePickerStyle())
                .font(.title)
                .padding(.horizontal, 30)
        }
        .onAppear {
            viewModel.loadData(selectedDate: dateFormatter.string(from: selectedDate))
        }
    }
}

//struct PhotoSelectOfMarsByDateView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoSelectOfMarsByDateView( viewModel: PhotoSelectMarsDateViewModel())
//    }
//}
