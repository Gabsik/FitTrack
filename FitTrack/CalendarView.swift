//
//  CalendarView.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 27.12.2025.
//

import SwiftUI

struct CalendarViewRepresentable: UIViewRepresentable {
    @Binding var selectedDate: Date? // Для передачи даты в SwiftUI

    func makeUIView(context: Context) -> UICalendarView {
        let calendarView = UICalendarView()
        calendarView.tintColor = UIColor.red
        calendarView.delegate = context.coordinator
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.backgroundColor = .backgroundCalendar
        calendarView.layer.cornerRadius = 20
        calendarView.fontDesign = .rounded
//        calendarView.tintColor = .white
        // Make sure our calendar view adapts nicely to size constraints.
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        calendarView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        return calendarView
    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UICalendarViewDelegate {
        var parent: CalendarViewRepresentable

        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }

        func calendarView(_ calendarView: UICalendarView, selectionDidEndDisplayingDecorationFor dateComponents: DateComponents) {
            // Можно использовать для отображения событий или другой логики
        }

        func calendarView(_ calendarView: UICalendarView, didSelect dateComponents: DateComponents?) {
            if let date = dateComponents?.date {
                parent.selectedDate = date
            }
        }
    }
}
