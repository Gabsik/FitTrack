//
//  Calendar.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import SwiftUI
import FSCalendar
import UIKit

struct FSCalendarView: UIViewRepresentable {

    @Binding var selectedDate: Date?

    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.appearance.weekdayTextColor = .white          // дни недели
        calendar.appearance.headerTitleColor = .white          // "December 2025"
        calendar.appearance.titleDefaultColor = .white         // цифры текущего месяца
        calendar.appearance.titlePlaceholderColor = .gray      // цифры прошлого/след. месяца
        calendar.appearance.titleWeekendColor = .systemRed     // выходные (опционально)
        calendar.firstWeekday = 2                              // показывать календарь с ПН
        calendar.appearance.selectionColor = .black            // кружок выделения
        calendar.appearance.titleSelectionColor = .white       // цифра выделенного дня
        calendar.appearance.borderRadius = 0.5                 // изменить кружок выбранной дате
        calendar.appearance.todayColor = .background           // кружок "today"
        calendar.appearance.titleTodayColor = .white           // цифра "today"
        calendar.locale = Locale(identifier: "ru_RU")
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        // Обновление календаря, если данные меняются
        //        uiView.reloadData()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(selectedDate: $selectedDate)
    }

    // Координатор для обработки делегатов
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        private var selectedDate: Binding<Date?>

        init(selectedDate: Binding<Date?>) {
            self.selectedDate = selectedDate
        }
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            selectedDate.wrappedValue = date
        }

        func calendar(_ calendar: FSCalendar,
                      shouldSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) -> Bool {

            if let current = selectedDate.wrappedValue,
               Calendar.current.isDate(current, inSameDayAs: date) {

                calendar.deselect(current)          // снять выделение в UI
                selectedDate.wrappedValue = nil     // обновить SwiftUI состояние
                return false                        // не даём снова выбрать этот же день
            }

            return true
        }

    }
}
