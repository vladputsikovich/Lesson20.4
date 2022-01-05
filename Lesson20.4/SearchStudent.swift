//
//  SearchStudent.swift
//  Lesson20.4
//
//  Created by Владислав Пуцыкович on 6.01.22.
//

import Foundation

struct SearchStudent {
    static func searchByNameFemale(searchText search: String, students: [Student]) -> [Student]{
        if search.isEmpty {
            return students
        }
        return students.filter { $0.name.contains(search.lowercased()) || $0.female.contains(search.lowercased()) }
    }
}
