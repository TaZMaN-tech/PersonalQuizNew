//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var characterLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let score = calculateScore(in: answersChosen)
        guard let score else {
            fatalError("No score found")
        }
        showResult(for: score)

    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func calculateScore(in answers: [Answer]) -> Answer? {
        let countedSet = NSCountedSet(array: answers)
        return countedSet
            .max {
                countedSet.count(
                    for: $0
                ) < countedSet.count(
                    for: $1
                )
            } as? Answer
    }
    
    private func showResult(for answer: Answer) {
        characterLabel.text = "Вы - \(String(answer.animal.rawValue))"
        definitionLabel.text = answer.animal.definition
    }
}
