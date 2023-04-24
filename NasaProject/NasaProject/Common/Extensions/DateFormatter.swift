import Foundation

enum DateElements: String {
    case day = "d"
    case month = "MMMM"
    case monthNumbers = "MM"
    case year = "yyyy"
    case monthInNominativeCase = "LLLL" // Именительный падеж: Декабрь, Январь, Апрель ...
    case dayWithPoint = "dd."
    case monthNumbersWithPoint = "MM."
}

extension Date {
    fileprivate func toString(elements: [DateElements]) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        var editStyle: String = ""
        elements.forEach{ editStyle += " \($0.rawValue)"}
        dateFormatter.dateFormat = editStyle

        return dateFormatter.string(from: self)
    }
}

extension String {
    //  expected formate: "2021-04-25T20:59:59Z"
    func toStringDate(elements: DateElements...) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        let formattedDateString = date?.toString(elements: elements)
        
        return formattedDateString
    }
}
