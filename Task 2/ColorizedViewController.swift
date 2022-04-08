//
//  ColorizedViewController.swift
//  Task 2
//
//  Created by Andrey Zhivotov on 22.02.2022.
//

import UIKit

class ColorizedViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var currentViewColor: UIColor!
    var delegate: ColorizedViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = currentViewColor
        
        redSlider.value = Float(currentViewColor.rgba.red)
        greenSlider.value = Float(currentViewColor.rgba.green)
        blueSlider.value = Float(currentViewColor.rgba.blue)
        
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
        redTF.text = String(redSlider.value)
        greenTF.text = String(greenSlider.value)
        blueTF.text = String(blueSlider.value)

    }
    
    @IBAction func doneButonPress() {
        delegate.setNewColor(currentColorView: colorView.backgroundColor ?? currentViewColor)
        dismiss(animated: true)
    }

    private func changeColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

// MARK: - Configuration Slider Action

extension ColorizedViewController {
    
    @IBAction func redSliderAction() {
        redLabel.text = String(NSString(format: "%.2f", redSlider.value))
        redTF.text = String(NSString(format: "%.2f", redSlider.value))
        changeColor()
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = String(NSString(format: "%.2f", greenSlider.value))
        greenTF.text = String(NSString(format: "%.2f", greenSlider.value))
        changeColor()
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(NSString(format: "%.2f", blueSlider.value))
        blueTF.text = String(NSString(format: "%.2f", blueSlider.value))
        changeColor()
    }
}

// MARK: - Separated RGB

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}




