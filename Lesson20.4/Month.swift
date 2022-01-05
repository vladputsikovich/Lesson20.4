//
//  Month.swift
//  Lesson20.4
//
//  Created by Владислав Пуцыкович on 5.01.22.
//

import Foundation

struct Month {
    var RU: String
    var EN: String
    
    static let monthes: [Month] = [
        Month(RU: "Январь", EN: "January"),
        Month(RU: "Февраль", EN: "February"),
        Month(RU: "Март", EN: "March"),
        Month(RU: "Апрель", EN: "April"),
        Month(RU: "Май", EN: "May"),
        Month(RU: "Июнь", EN: "June"),
        Month(RU: "Июль", EN: "July"),
        Month(RU: "Август", EN: "August"),
        Month(RU: "Сентябрь", EN: "September"),
        Month(RU: "Октябрь", EN: "October"),
        Month(RU: "Ноябрь", EN: "November"),
        Month(RU: "Декабрь", EN: "December")
    ]
    
}
