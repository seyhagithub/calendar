//
//  ViewController.swift
//  Calendar
//
//  Created by chanthem on 2/24/19.
//  Copyright © 2019 chanthem. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

  @IBOutlet weak var calendarheightConstraint: NSLayoutConstraint!
  @IBOutlet weak var calendarView: FSCalendar!
  
  lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    return formatter
  }()
  
  lazy var dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd"
    return formatter
  }()
  
  // this variable is expected result from server side
  let khmerDates: [[String:KhmerDate]] = [
    ["2019/01/28": KhmerDate(khmerDate: "៨ រោច", khmerMonth: "បុស្ស", isBuddhistDay: true)],
    ["2019/01/29": KhmerDate(khmerDate: "៩ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/01/30": KhmerDate(khmerDate: "១០ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/01/31": KhmerDate(khmerDate: "១១ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/02/01": KhmerDate(khmerDate: "១២ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/02/02": KhmerDate(khmerDate: "១៣ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/02/03": KhmerDate(khmerDate: "១៤ រោច", khmerMonth: "បុស្ស", isBuddhistDay: false)],
    ["2019/02/04": KhmerDate(khmerDate: "១៥ រោច", khmerMonth: "បុស្ស", isBuddhistDay: true)],
    ["2019/02/05": KhmerDate(khmerDate: "១ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/06": KhmerDate(khmerDate: "២ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/07": KhmerDate(khmerDate: "៣ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/08": KhmerDate(khmerDate: "៤ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/09": KhmerDate(khmerDate: "៥ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/10": KhmerDate(khmerDate: "៦ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/11": KhmerDate(khmerDate: "៧ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/12": KhmerDate(khmerDate: "៨ កើត", khmerMonth: "មាឃ", isBuddhistDay: true)],
    ["2019/02/13": KhmerDate(khmerDate: "៩ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/14": KhmerDate(khmerDate: "១០ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/15": KhmerDate(khmerDate: "១១ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/16": KhmerDate(khmerDate: "១២ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/17": KhmerDate(khmerDate: "១៣ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/18": KhmerDate(khmerDate: "១៤ កើត", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/19": KhmerDate(khmerDate: "១៥ កើត", khmerMonth: "មាឃ", isBuddhistDay: true)],
    ["2019/02/20": KhmerDate(khmerDate: "១ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/21": KhmerDate(khmerDate: "២ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/22": KhmerDate(khmerDate: "៣ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/23": KhmerDate(khmerDate: "៤ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/24": KhmerDate(khmerDate: "៥ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/25": KhmerDate(khmerDate: "៦ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/26": KhmerDate(khmerDate: "៧ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/02/27": KhmerDate(khmerDate: "៨ រោច", khmerMonth: "មាឃ", isBuddhistDay: true)],
    ["2019/02/28": KhmerDate(khmerDate: "៩ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/03/01": KhmerDate(khmerDate: "១០ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/03/02": KhmerDate(khmerDate: "១១ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/03/03": KhmerDate(khmerDate: "១២ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/03/04": KhmerDate(khmerDate: "១៣ រោច", khmerMonth: "មាឃ", isBuddhistDay: false)],
    ["2019/03/05": KhmerDate(khmerDate: "១៤ រោច", khmerMonth: "មាឃ", isBuddhistDay: true)],
    ["2019/03/06": KhmerDate(khmerDate: "១ កើត", khmerMonth: "ផល្គុន", isBuddhistDay: false)],
    ["2019/03/07": KhmerDate(khmerDate: "៣ កើត", khmerMonth: "ផល្គុន", isBuddhistDay: false)],
    ["2019/03/08": KhmerDate(khmerDate: "៣ កើត", khmerMonth: "ផល្គុន", isBuddhistDay: false)],
    ["2019/03/09": KhmerDate(khmerDate: "៤ កើត", khmerMonth: "ផល្គុន", isBuddhistDay: false)],
    ["2019/03/10": KhmerDate(khmerDate: "៥ កើត", khmerMonth: "ផល្គុន", isBuddhistDay: false)]
    ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // register custom cell
    calendarView.register(BuddhistCell.self, forCellReuseIdentifier: "cell")
    // change language month and day to khmer
    calendarView.locale = Locale(identifier: "km")
    // add gesture swipe up and down to change calendar scope month / week
    let scopeGesture = UIPanGestureRecognizer(target: self.calendarView, action: #selector(self.calendarView.handleScopeGesture(_:)))
    self.calendarView.addGestureRecognizer(scopeGesture)
  }
  
  // Get Khmer date from array khmer dates
  private func khmerDate(by date: String) -> KhmerDate? {
    let dict = khmerDates.first { (dict) -> Bool in
      return dict.keys.first == date
    }
    guard let dic = dict, let khmerDate = dic[date] else {
      return nil
    }
    return khmerDate
  }
}

// MARK: - Conform delegate
extension ViewController: FSCalendarDelegate {
  func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
    calendarheightConstraint.constant = bounds.height
    self.view.layoutIfNeeded()
  }
  
  func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
    return monthPosition == .current
  }
  
  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    
    if let cell = calendar.cell(for: date, at: monthPosition) as? BuddhistCell {
      cell.setNeedsLayout()
    }
  }
}

// MARK: - Conform datasource
extension ViewController: FSCalendarDataSource {
  // Set minimum display date of calendar, if don't want to limit, no need to set
  func minimumDate(for calendar: FSCalendar) -> Date {
    return dateFormatter.date(from: "2019/01/01")!
  }
  
  // Set maximum display date of calendar, if don't want to limit, no need to set
  func maximumDate(for calendar: FSCalendar) -> Date {
    return dateFormatter.date(from: "2019/12/31")!
  }
  
  // Config cusotm cell
  func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
    let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position) as! BuddhistCell
    let stringDate = dateFormatter.string(from: date)
    if let khmerDate = khmerDate(by: stringDate) {
      cell.isBuddhaDay = khmerDate.isBuddhistDay ?? false
    }
    return cell
  }
  
  // Config subtitle (khmer day)
  func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
    let stringDate = dateFormatter.string(from: date)
    guard let khmerDate = khmerDate(by: stringDate) else {
      return nil
    }
    guard khmerDate.khmerDate == "១ កើត" else {
      return khmerDate.khmerDate
    }
    return String(format: "%@\n%@", khmerDate.khmerDate!, khmerDate.khmerMonth!)
  }
}

