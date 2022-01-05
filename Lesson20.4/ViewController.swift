//
//  ViewController.swift
//  Lesson20.4
//
//  Created by Владислав Пуцыкович on 5.01.22.
//

import UIKit

struct Constants {
    static let identificator = "MyCell"
    static let sizeRow: CGFloat = 50
    static let dateFormat = "dd MMMM yyyy"
    static let dateFormatMonth = "MMMM"
    static let placeholderSearch = "Поиск"
    static let names = ["vlad", "sasah", "kirrila", "voca", "oleg"]
    static let females = ["puts", "ijke", "some", "dame", "cole"]
}

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    private var searchBar = UISearchBar()
    private var segement = UISegmentedControl()
    private var students = [Student]()
    private var searchStudent = [Student]()
    private var studentSections = [StudentSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        students = Student.createStudents()
        studentSections = StudentSection.setStudentSections(studs: students)
        createTable()
        createSearchView()
    }
    
    func createTable() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.identificator)
        view.addSubview(tableView)
    }
    
    func createSearchView() {
        searchBar = UISearchBar(
            frame: CGRect(
                x: .zero,
                y: tableView.bounds.origin.y - Constants.sizeRow / 5,
                width: tableView.bounds.width,
                height: Constants.sizeRow
            )
        )
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.placeholder = Constants.placeholderSearch
        tableView.addSubview(searchBar)
    }
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

// MARK: UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        studentSections = StudentSection.setStudentSections(
            studs: SearchStudent.searchByNameFemale(
                searchText: searchText,
                students: students
            )
        )
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        let cell = UITableViewCell(
            style: UITableViewCell.CellStyle.value1,
            reuseIdentifier: Constants.identificator
        )
        cell.textLabel?.text = "\(studentSections[indexPath.section].students[indexPath.row].name) \(studentSections[indexPath.section].students[indexPath.row].female)"
        cell.detailTextLabel?.text = dateFormatter.string(
            from: studentSections[indexPath.section].students[indexPath.row].yearOfBirth
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentSections[section].students.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.sizeRow
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return studentSections[section].dateOfBirth
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return studentSections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var monthLetters: [String] = []
        Month.monthes.forEach { month in
            monthLetters.append("\(month.EN.first ?? "x")")
        }
        return monthLetters
    }
}
