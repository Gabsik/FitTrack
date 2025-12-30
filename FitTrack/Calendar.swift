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
//    @Binding var selectedDate: Date // Связь с датой в SwiftUI

    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.appearance.weekdayTextColor = .white          // дни недели
        calendar.appearance.headerTitleColor = .white          // "December 2025"
        calendar.appearance.titleDefaultColor = .white         // цифры текущего месяца
        calendar.appearance.titlePlaceholderColor = .gray      // цифры прошлого/след. месяца
        calendar.appearance.titleWeekendColor = .systemRed     // выходные (опционально)
        calendar.firstWeekday = 2
        calendar.appearance.selectionColor = .black        // кружок выделения
        calendar.appearance.titleSelectionColor = .white       // цифра выделенного дня
        calendar.appearance.borderRadius = 0.5
        calendar.appearance.todayColor = .background         // кружок "today"
        calendar.appearance.titleTodayColor = .white           // цифра "today"
        calendar.locale = Locale(identifier: "ru_RU")
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        // Обновление календаря, если данные меняются
        uiView.reloadData()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Координатор для обработки делегатов
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: FSCalendarView

        init(_ parent: FSCalendarView) {
            self.parent = parent
        }

        // Обработка выбора даты
//        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//            parent.selectedDate = date
//        }

        // Добавление точек или изображений (пример)
//        func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//            // Если есть событие, возвращаем изображение
//            return nil // Или ваше изображение
//        }
        // Добавление точек
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            // Возвращаем количество точек для события
            return 0
        }
    }
}
