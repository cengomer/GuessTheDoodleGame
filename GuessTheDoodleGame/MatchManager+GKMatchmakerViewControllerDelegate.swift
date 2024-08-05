//
//  MatchManager+GKMatchmakerViewControllerDelegate.swift
//  GuessTheDoodleGame
//
//  Created by omer elmas on 30.06.2024.
//

import Foundation
import GameKit

extension MatchManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        startGame(newMatch: match)
    }
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: any Error) {
        viewController.dismiss(animated: true)
    }
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
    }
}
