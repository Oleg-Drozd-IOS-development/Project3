//
//  SecondViewController.swift
//  Project 3
//
//  Created by мак on 29.09.2020.
//

import UIKit

class SecondViewController: UIViewController {
    var UserName: String?
    var TextFromWeekly: String?
    @IBOutlet weak var text: UILabel!
    var TextFromTemperature: String?
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBAction func BackButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "BackToFirstView", sender: nil)
    }
    @IBAction func unwindSegueToMainScreen (segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "SegueWeekly":
            guard let sw = segue.source as? WeeklyFinder else { return }
             self.TextFromWeekly = sw.text.text
             text.text! += ("\(UserName ?? " "), output value:  \(self.TextFromWeekly ?? " ")\n")
        case "TreethSegue":
            guard let st = segue.source as?  TemperatureConverter else { return }
            self.TextFromTemperature = st.OutputTemperature
            text.text! += ("\(UserName ?? " "), output value:  \(self.TextFromTemperature ?? " ") ºC\n")
        default:
            text.text! += "  "
        }
    }
    @IBAction func GoToWeeklyFinderButtomAction(_ sender: UIButton) {performSegue(withIdentifier: "SegueTwoOnWeekly", sender: nil)
        text.text! = " "
    }
    @IBAction func GoToTemperatureConverterButtomAction(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueTwoOnTemperatureConvertor", sender: nil)
        text.text! = " "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let text = UserName else { return }
        UserNameLabel.text = "Hello, \(text)" 
    }
}
