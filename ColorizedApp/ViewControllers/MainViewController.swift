//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Ewgeniy Izyurov on 11.11.2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func setColorWith(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat)
}

final class MainViewController: UIViewController {
    
    private var redColor: CGFloat = 0
    private var greenColor: CGFloat = 0
    private var blueColor: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let setupVC = segue.destination as? SetupViewController
        
        setupVC?.redColor = redColor
        setupVC?.greenColor = greenColor
        setupVC?.blueColor = blueColor
        
        setupVC?.delegate = self
    }
    
    
}

//MARK: MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate {
    
    func setColorWith(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        redColor = red
        greenColor = green
        blueColor = blue
        
        view.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
        
    }
    
}



