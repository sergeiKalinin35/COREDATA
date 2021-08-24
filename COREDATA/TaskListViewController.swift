//
//  ViewController.swift
//  COREDATA
//
//  Created by Sergey on 22.08.2021.
//

import UIKit
import CoreData


class TaskListViewController: UITableViewController {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    private let cellID = "cell"
    private var tasks: [Task] = []
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavigationBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    

    // настройка навигатион бара
    
    private func setupNavigationBar() {
        title = "Task List" // Заголовок
        navigationController?.navigationBar.prefersLargeTitles = true //Большой бар
        
        
        
        
        // Внешний вид Навиг Бара
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()// полупрозрачный бар
        
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white] // заголовок цвета 2 свойства
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] //скролим поэтому разные цвета
        
        navBarAppearance.backgroundColor = UIColor(    // цвет самого нафигатион бара
            displayP3Red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        
        // для обоих состояний передаем данные настройки
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        
        // добавляем кнопку right
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask) //#selector(addNewTask) делаем новый метод
            
        )
        
        
        navigationController?.navigationBar.tintColor = .white // красим кнопку
        
        
        
        }
        
    
    @objc private func addNewTask() { // реализуем этот метод программно переход делаем новый вью контроллер
        
        let newTaskVC = NewTaskViewController()
        // делаем переход теперь как подписались к вью новому
        present(newTaskVC, animated: true)
        
        // при переходи зависает на пол пути решение///красив второй вью в белый цвет. Сработало но не закрывается полностью
        
    }
    
    
    // запрос данных c  типом task(NSManagetObject)
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
    }
    
    
    
    
    
    
    
    
    
    
    

}

//MARK: - Table view data source

extension TaskListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    
 
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        // отображаем данные с context
        let task = tasks[indexPath.row]
        // новый способ работы с ячейкой
        var сontent = cell.defaultContentConfiguration()// структура
        content.text = task.name
        cell.contentConfiguration = content
        
        
        
        
        
    return cell
    }
    
    
    
    
}
