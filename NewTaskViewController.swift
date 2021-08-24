//
//  NewTaskViewController.swift
//  COREDATA
//
//  Created by Sergey on 22.08.2021.
//

import UIKit

import CoreData


class NewTaskViewController: UIViewController {
    
private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    
    
    
    
    
    
    
    // lazy это отложенная инициализация /// чтобы не нагружать систему
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
 // прежде чем вернуть UITextField() мы можем настроить его параметры
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect // граница текст  поля округлили
        
        
        
        
        return textField
        
}()
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 1
        ) // цвет кнопки
        
        button.setTitle("Save Task", for: .normal)   // заголовок кнопки
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)//шрифт
        button.setTitleColor(.white, for: .normal)// цвет заголовка
        button.layer.cornerRadius = 5                //скруглим углы
        // действие при нажатие на эту кнопку
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = #colorLiteral(red: 0.9365946651, green: 0.1841237247, blue: 0.1575583518, alpha: 1)//UIColor(
           // red: 21/255,
         //   green: 101/255,
         //   blue: 192/255,
         //   alpha: 1
      //  ) // цвет кнопки
        
        button.setTitle("Cancel", for: .normal)   // заголовок кнопки
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)//шрифт
        button.setTitleColor(.white, for: .normal)// цвет заголовка
        button.layer.cornerRadius = 5                //скруглим углы
        // действие при нажатие на эту кнопку
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        return button
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        
    
    
    
    
    }
    
    private func setupSubviews() {
        // вызываем метод констрейтов  это одного поля ягода
        
        view.addSubview(taskTextField)// выводим TextField на вью
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        
    }
    
    // отключаем автоматическую расстановку
    
    private func setupConstraints() {
        // отключаем параметры нашего текстового поля
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // отступы
        NSLayoutConstraint.activate([
           // вверх top
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            // правая сторона trailing
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            // левая сторона leading
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        
        
        
        ])
        
      
            // отключаем параметры нашего текстового поля
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            
            // отступы
            NSLayoutConstraint.activate([
               // вверх top
                saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 30),
                // правая сторона trailing
                saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                // левая сторона leading
                saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
            
            ])
            
        // отключаем параметры нашего текстового поля
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        // отступы
        NSLayoutConstraint.activate([
           // вверх top
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30),
            // правая сторона trailing
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            // левая сторона leading
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        
        ])
        
        
        
        
        
        
        
        
        
        }
        
        
    @objc func save() {
        // сохраняем данные в context  и отоброжаем потом все в первом вьюКонтроллере
        guard let entityDescription = NSEntityDescription.entity(forEnityName: "Task", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInfo: context) as? Task  else { return }
        
        task.name = taskTextField.text
        if context.hasChanges {
            
            do {
                
                
            } catch let error {
                
                 try context.save()
                
                
                print(error)
            }
        }
       
        dismiss(animated: true)
        
    }
    
    @objc func cancel() {
        
        dismiss(animated: true)
    }
    
    
    
}






    
    
    
    
    
    
    
    
    
    
    


























