//
//  StartingViewController.swift
//  Task 2
//
//  Created by Andrey Zhivotov on 26.03.2022.
//

import UIKit

protocol ColorizedViewControllerDelegate {
    func setNewColor(currentColorView: UIColor)
}

class StartingViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorizedVC = segue.destination as? ColorizedViewController else { return }
        colorizedVC.currentViewColor = view.backgroundColor
        colorizedVC.delegate = self
    }

}

extension StartingViewController: ColorizedViewControllerDelegate {
    func setNewColor(currentColorView: UIColor) {
        view.backgroundColor = currentColorView
    }
}
