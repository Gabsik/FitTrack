//
//  WorkoutDayViewModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 29.01.2026.
//

import Foundation

class WorkoutDayViewModel: ObservableObject {
    @Published var state: State

    private let output: (Output) -> Void
    var input: ((Input) -> Void)?

    init(
        state: State,
        output: @escaping (Output) -> Void
    ) {
        self.state = state
        self.output = output
    }
}

extension WorkoutDayViewModel {
    struct State {
        var nameWorkout: String = ""
        var selectedDate: Date
    }
}

extension WorkoutDayViewModel {
    enum Input {
    }
}

extension WorkoutDayViewModel {
    enum Output {
    }
}
