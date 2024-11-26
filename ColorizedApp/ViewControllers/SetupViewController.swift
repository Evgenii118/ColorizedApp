//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Ewgeniy Izyurov on 03.10.2024.
//

import UIKit

final class SetupViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var paintedView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    //MARK: Variables
    weak var delegate: MainViewControllerDelegate?
    
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        paintedView.layer.cornerRadius = 15
        
        updateUI()
    }
    
    private func updateUI(){
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        
        self.paintedView.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func goToMainVC() {
        setColorForModel()
        
        saveColor()
        
        delegate?.setColorWith(
            redColor,
            greenColor,
            blueColor
        )
        
        dismiss(animated: true)
        
    }
    
    // MARK: Private function
    private func saveColor() {
        redColor = CGFloat(redSlider.value)
        greenColor = CGFloat(greenSlider.value)
        blueColor = CGFloat(blueSlider.value)
        //print("Цвет - \(backColor)")
    }
    
    private func setColor() {
        paintedView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    private func setColorForModel() {
        redColor = CGFloat(redSlider.value)
        blueColor = CGFloat(blueSlider.value)
        greenColor = CGFloat(greenSlider.value)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
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

// MARK: Extension for Float
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
