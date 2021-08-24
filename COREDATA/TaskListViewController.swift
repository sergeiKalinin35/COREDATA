//
//  ViewController.swift
//  COREDATA
//
//  Created by Sergey on 22.08.2021.
//

import UIKit
import CoreData


class TaskListViewController: UITableViewController {
    
    
    private let cellID = "cell"
    private var tasks: [Task] = []
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       setupNavigationBar()
        
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
        
    
    @objc func addNewTask() { // реализуем этот метод программно переход делаем новый вью контроллер
        
        let newTaskVC = NewTaskViewController()
        // делаем переход теперь как подписались к вью новому
        present(newTaskVC, animated: true)
        
        // при переходи зависает на пол пути решение///красив второй вью в белый цвет. Сработало но не закрывается полностью
        
    }
    

}

//MARK: - Table view data source 
