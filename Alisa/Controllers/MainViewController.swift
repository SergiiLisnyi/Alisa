//
//  ViewController.swift
//  Alisa
//
//  Created by Sergii Lisnyi on 11/15/18.
//  Copyright © 2018 Sergii Lisnyi. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    // MARK: - Instance Properties
    var context: NSManagedObjectContext!
    var levelSelected: LevelName = .junior
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CoreDataHelper.deleteEntityFromDB(EntityName.Test)
        CoreDataHelper.getDataFromFile()
        
    }
    
    
    @IBAction func switchLevelButton(_ sender: UIButton) {
        let alertView = UIAlertController(title: nil, message: "Select a level", preferredStyle: .actionSheet)
        LevelName.allCases.forEach { (level) in
            let action = UIAlertAction(title: level.description.uppercased(), style: .default, handler: { [weak self] _ in
                alertView.dismiss(animated: true, completion: nil)
                self?.levelSelected = level
                self?.levelLabel.text = self?.levelSelected.description.uppercased()

            })
            action.isEnabled = !(levelSelected == level)
            alertView.addAction(action)
        }
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in alertView.dismiss(animated: true, completion: nil) }))
        present(alertView, animated: true, completion: nil)
    }
    
    
    
    @IBAction func startTestingButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Testing", bundle: nil)
        guard let testingStoryBoard = storyboard.instantiateViewController(withIdentifier: "Testing") as? TestingViewController else { return }
        testingStoryBoard.model = ModelTesting(level: levelSelected)
        testingStoryBoard.level = levelSelected.description.uppercased()
        navigationController?.pushViewController(testingStoryBoard, animated: true)
        

        //   guard let testingVC = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: LoginViewController.reuseIdentifier) as? TestingViewController else { return }
        // guard let testingVC = UIStoryboard(name: "Testing", bundle: Bundle.main).instantiateViewController(withIdentifier: "TestingViewController") as? TestingViewController else { return }
        //  UIApplication.shared.keyWindow?.rootViewController = testingVC
    }
    
    @IBAction func middleButton(_ sender: UIButton) {
        print("Middle")
    }
    
    @IBAction func seniorButton(_ sender: UIButton) {
        print("Senior")
    }
    
}

