//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ewgeniy Izyurov on 03.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var paintedView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPaintedView()
    }
    
    // MARK: - IB Action
    @IBAction func redSliderAction() {
        changeColorPaintedView()
        redLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        changeColorPaintedView()
        greenLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        changeColorPaintedView()
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: Private function
    private func setupPaintedView() {
        paintedView.layer.cornerRadius = 15
        paintedView.backgroundColor = UIColor(
            red: 0.5,
            green: 0.5,
            blue: 0.5,
            alpha: 1
        )
    }
    
    private func changeColorPaintedView() {
        paintedView.backgroundColor = UIColor(
            cgColor: CGColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1
            )
        )
    }
}

