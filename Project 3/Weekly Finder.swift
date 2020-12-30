//
//  ViewController.swift
//  Weekly Finder
//
//  Created by мак on 19.09.2020.
//

import UIKit

class WeeklyFinder: UIViewController {

    var FlagChangeRu : Bool = false, FlagChangeUkr : Bool = false
    let ArrayLanguageDictionary : [String : String ] = [ "Ru" : "ru_RU", "Ukr" : "UKR", "En" : "ENG" ]
    let ArrayLanguage : [String] = ["Ru" , "Ukr", "En"]
    var error : String = "Input incorrect value"
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var text: UILabel!
    @IBAction func BackBottonAction(_ sender: UIButton) {performSegue(withIdentifier: "SegueWeekly", sender: nil)
    }
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        guard let dayOfMonth = day.text, let monthOfYear = month.text, let yearOfEra = year.text else {return}
        guard dayOfMonth != "" && monthOfYear != "" && yearOfEra != "" else {text.text = error; return}
        guard Int(dayOfMonth)! < 32 && Int(monthOfYear)! < 13 && Int(yearOfEra)! > 0 && Int(dayOfMonth)! > 0 && Int(monthOfYear)! > 0 else {text.text = error; return}
        // три проверки введённых значений
        let calendar = Calendar.current //выбор нашего-григорианского календаря
        var ComponentsOfDate = DateComponents()// создание нужных полей даты
        ComponentsOfDate.day = Int(dayOfMonth)
        ComponentsOfDate.month = Int(monthOfYear)
        ComponentsOfDate.year = Int(yearOfEra)
        let FormatOfDate = DateFormatter() // вывод нужной нам даты в ножном формате или преобразование её
        switch Language.text {
        case "Ru":
            FormatOfDate.locale = Locale(identifier: "ru_RU")
        case "Ukr":
            FormatOfDate.locale = Locale(identifier: "UKR")
        case "En":
            FormatOfDate.locale = Locale(identifier: "ENG")
        default:
            text.text = "Input incorrect language"
        }
        FormatOfDate.dateFormat = "EEEE"
        
        guard let AllData = calendar.date(from: ComponentsOfDate) else { text.text = "Input incorrect value";  return}
        let DayOfWeek = FormatOfDate.string(from: AllData)
        switch Language.text {
        case "Ru":
            let RusDayOfWeek = DayOfWeek.capitalized
            text.text = RusDayOfWeek
        case "Ukr":
            let UkrDayOfWeek = DayOfWeek.capitalized
            text.text = UkrDayOfWeek
        case "En":
            let EnDayOfWeek = DayOfWeek.capitalized
            text.text = EnDayOfWeek
        default:
            text.text = DayOfWeek
        }
    }
    @IBOutlet weak var CommonButton: UIButton!
    @IBOutlet weak var Language: UILabel!
    @IBAction func ChangeLanguage(_ sender: UIButton)
    {
        switch Language.text {
        case "Ru":
            CommonButton.setTitle("Натиснути", for: .normal)
            Language.text = "Ukr"
            DayLabel.text  = "День"
            MonthLabel.text = "Місяць"
            YearLabel.text = "Рік"
            text.text = "Введіть дату пошуку, натисніть кнопку, якщо ви хочете знати день тижня"
            error = "Введено некоректне значення"
        case "Ukr":
            CommonButton.setTitle("Press", for: .normal)
            Language.text = "En"
            DayLabel.text = "Day"
            MonthLabel.text = "Month"
            YearLabel.text = "Year"
            text.text = "Input the date find press on button if you want to know the day of the week"
            error = "Input incorrect value"
        case "En":
            CommonButton.setTitle("Нажать", for: .normal)
            Language.text = "Ru"
            DayLabel.text = "День"
            MonthLabel.text = "Месяц"
            YearLabel.text = "Год"
            text.text = "Введите дату и нажмите кнопку, если хотите узнать день недели."
            error = "Введено некоректное значение"
        default:
            text.text = "Input incorrect language"
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }//функция чтобы клавиатура ушадила вниз по нажатию на экран
}
