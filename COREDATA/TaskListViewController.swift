//
//  ViewController.swift
//  COREDATA
//
//  Created by Sergey on 22.08.2021.
//





/// мы просто сохраняем данные и восстанавливаем /// передача данных не происходит между вью
// второе вью избыточное  2 кнопки и текст филд ( переносим все это в алерт контроллер) добавляем текстовое поле в алерт контроллер /

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
    // вью исчезла модальный переход не скрывает полностью экран 
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDisappear")
    }
    
    
    
    
    //данные обновляются при открывания экрана много раз // Didload загружает данные один раз на вью
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        fetchData()
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
        
    
    @objc private func addNewTask() {
        
        
        showAlert(withTitle: " Add New Task", andMessage: "What do you want to do?")
        
        
        
    // реализуем этот метод программно переход делаем новый вью контроллер
        
      //  let newTaskVC = NewTaskViewController()
        
    //    newTaskVC.modalPresentationStyle = .fullScreen // открываем полностью второй экран
        // делаем переход теперь как подписались к вью новому
    //    present(newTaskVC, animated: true)
        
        // при переходи зависает на пол пути решение///красив второй вью в белый цвет. Сработало но не закрывается полностью
        
    }
    
    
    // запрос данных c  типом task(NSManagetObject)
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        
        do {
           
           tasks = try context.fetch(fetchRequest)
            
        } catch let error {
            
            print(error)
            
        }
       
    }
    
    // создаем алерт контроллер  (окно)
    private func showAlert(withTitle title: String, andMessage message: String) {
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "SAVE", style: .default) { _ in
            guard let task = alert.textFields?.first?.text, !task.isEmpty  else { return }
            
            self.save (task)
            
        }
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive)  //  destructive кнопка будет красная
            // добавляем текстовое поле
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
        
        }
    
    private func save(_ taskName: String) {
        
        guard let entityDescription = NSEntityDescription.entity(forEnityName: "Task", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInfo: context) as? Task  else { return }
        
        task.name = taskName
        tasks.append(task)
        
        // отобразить появление строки в интерфейсе  для этого нужно знать индекс по которому мы хотим отобразить эти данные
        let  cellIndex = IndexPath(row: task.count - 1, section: 0)
        tavleView.insertRows(at: [cellIndex], with: .automatic)
        
        
        // отображение анимированной строчки
        
        
        if context.hasChanges {
            
            do {
                
                
            } catch let error {
                
                 try context.save()
                
                
                print(error)
            }
        
    }
    
    
    
}

//MARK: - Table view data source

extension TaskListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
