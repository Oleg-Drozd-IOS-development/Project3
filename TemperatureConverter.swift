//
//  TemperatureConverter.swift
//  Project 3
//
//  Created by мак on 29.09.2020.
//

import UIKit

class TemperatureConverter: UIViewController {
    var Flag: Bool = true
    @IBOutlet weak var Celsium: UILabel!
    @IBOutlet weak var Farengate: UILabel!
    @IBOutlet weak var OutletSlider: UISlider!
    {
        didSet{
            if  Flag == true
            {
                OutletSlider.value = 0
                OutletSlider.maximumValue = 100
                OutletSlider.minimumValue = 0
            }
            else
            {
                OutletSlider.value = -100
                OutletSlider.maximumValue = 0
                OutletSlider.minimumValue = -100
            }
        }
    }
    @IBOutlet weak var Switcher: UISwitch!
    @IBAction func SwitcherAction(_ sender: UISwitch)
    {
        Flag = sender.isOn
        if  Flag == true
        {
            OutletSlider.value = 0
            OutletSlider.maximumValue = 100
            OutletSlider.minimumValue = 0
        }
        else
        {
            OutletSlider.value = -100
            OutletSlider.maximumValue = 0
            OutletSlider.minimumValue = -100
        }
    }
    @IBAction func Slider(_ sender: UISlider)
    {
        let celsiumTemperature = Int(sender.value)
        Celsium.text = "\(celsiumTemperature)ºC"
        let faremgateTemperature = Int((sender.value * 9 / 5) + 32)
        Farengate.text = "\(faremgateTemperature)ºF"
    }
    @IBAction func BackToButtonAction(_ sender: UIButton) {performSegue(withIdentifier: "TreethSegue", sender: nil)
    }
}
