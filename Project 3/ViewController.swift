//
//  ViewController.swift
//  Project 3
//
//  Created by мак on 29.09.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UserNameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBAction func LoginButtonAction(_ sender: UIButton) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let svc = segue.destination as? SecondViewController, let text = UserNameTF.text else {return}
        svc.UserName = text
    }
    @IBAction func unwindSegueToMainScreenOne (segue: UIStoryboardSegue)
    {
        switch segue.identifier {
        case "BackToFirstView":
            guard let sw = segue.source as? SecondViewController else { return }
            self.TextOutputOutlet.text = sw.text.text
        default: break
        }
    }
    @IBOutlet weak var TextOutputOutlet: UILabel!
    @IBAction func unwindSegueToMainScreen (segue: UIStoryboardSegue)
    {
        guard let svc = segue.source as? SecondViewController else { return }
        self.TextOutputOutlet.text = ("\(svc.TextFromTemperature ?? " "), \(svc.TextFromWeekly ?? " ")")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }//функция чтобы клавиатура ушадила вниз по нажатию на экран
}

