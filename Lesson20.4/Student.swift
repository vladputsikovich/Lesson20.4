//
//  Student.swift
//  Lesson20.4
//
//  Created by Владислав Пуцыкович on 5.01.22.
//

import Foundation

struct StudentSection {
    var dateOfBirth: String
    var students: [Student]
    
    static func setStudentSections(studs: [Student]) -> [StudentSection] {
        var studentSections = [StudentSection]()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormatMonth
        Month.monthes.forEach { month in
            studentSections.append(
                StudentSection(
                    dateOfBirth: month.RU,
                    students: studs
                        .sorted { $0.name < $1.name }
                        .filter { dateFormatter.string(from: $0.yearOfBirth) == month.EN }
                )
            )
        }
        studentSections.forEach { stud in
            studentSections = studentSections.filter { !$0.students.isEmpty }
        }
        return studentSections
    }
}

class Student {
    var name: String
    var female: String
    var yearOfBirth: Date
    
    init(name: String, female: String, yearOfBirth: Date) {
        self.name = name
        self.female = female
        self.yearOfBirth = yearOfBirth
    }
    
    static func createStudents() -> [Student] {
        var students = [Student]()
        
        (0..<50).forEach { number in
            let student = Student(
                name: Constants.names.randomElement() ?? "name",
                female: Constants.females.randomElement() ?? "female",
                yearOfBirth: Date.getRandomDate()
            )
            students.append(student)
        }
        return students
    }
}
