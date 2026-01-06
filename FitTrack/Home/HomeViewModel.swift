//
//  ViewModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import Foundation

final class HomeViewModel {

    private let output: (Output) -> Void
    var input: ((Input) -> Void)?

    init(
        output: @escaping (Output) -> Void
    ) {
        self.output = output
    }

    func bind () {
        self.input = { [weak self] input in
            guard let self else { return }
            switch input {
            case .myExercisesTapped:
                self.output(.showMyExercises)
            }
        }
    }
}

extension HomeViewModel {
    enum Input {
        case myExercisesTapped
    }
}

extension HomeViewModel {
    enum Output {
        case showMyExercises
    }
}

