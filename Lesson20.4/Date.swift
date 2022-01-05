//
//  Date.swift
//  Lesson20.4
//
//  Created by Владислав Пуцыкович on 5.01.22.
//

import Foundation

extension Date {
    static func getRandomDate() -> Date {
        let date = Date()
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        var componentDate = calendar.date(from: dateComponent)
        
        dateComponent = DateComponents(calendar: calendar,
                                         year: Int.random(in: 1970..<2005),
                                         month: Int.random(in: 1...12),
                                         day: Int.random(in: 1...30))
        componentDate = calendar.date(from: dateComponent)
        return componentDate ?? date
    }
}
