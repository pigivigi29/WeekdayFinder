//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Елизавета Дубасова on 23.09.2023.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findWeekday() {
        
        // 1. При работе с датами сначала необходимо определить, по какому календарю мы живём.
        // Для этого можно воспользоваться свойством current структуры Calendar.
        // static var current: Calendar { get }
        // Это свойство определяет текущий календарь пользователя.
        let calendar = Calendar.current
        
        // 2. Теперь необходимо определить, из каких компонентов будет состоять наша дата.
        // У нас есть текстовые поля с: числом, месяцем и годом - это и есть компоненты нашей даты.
        // С компонентами даты позволяет работать структура DateComponents.
        // При создании экземпляра DateComponents компоненты даты устанавливаются со значением nil.
        var dateComponents = DateComponents()
        
        // 3. Проверка: а есть ли какие-либо значения в наших текстовых полях?
        // Если есть, то выполнение кода идёт дальше, если нет - нет.
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        // У структуры DateComponents есть множество свойств, характеризующих временные единицы, например, секунда, минута, час, день недели, эра и так далее.
        // Преобразуем текст из текстовых полей в числа (тип Int).
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        // 4. Теперь мы можем собрать дату из полученных нами компонентов даты, которые вводит пользователь.
        guard let date = calendar.date(from: dateComponents) else { return }
        
        // 5. Форматируем собранную дату, для того чтобы корректно её отобразить пользователю. А именно, нам необходимо показать пользователю только день недели этой даты.
        // Для дня недели используется флаг "ЕЕЕЕ" (см. документацию).
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        
        resultLabel.text = weekday
    }
    
    // данный метод определяет, что будет происходить, когда мы будем прикасаться к экрану (точнее к данному ViewController-у)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}

