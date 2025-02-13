//
//  ViewController.swift
//  counterPro
//
//  Created by Temurbek Uzakov on 10/02/2025.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    private let incrementText: String = " значение изменено на +1"
    private let dicrementText: String = " значение изменено на -1"
    private let resetText: String = " значение сброшено"
    private let invalidActionText: String =
        "попытка уменьшить значение счётчика ниже 0"
    //private let textViewOffset = CGPoint(x: 0, y: counterHistoryTextView)
    
    private var didRecordFirst: Bool = false
    private var dateFormatter = DateFormatter()

    private var counter: Int = 0 {
        didSet {
            counterLabel.text = String(counter)
        }
    }
    private var counterHistory: String = "История изменений:" {
        didSet {
            counterHistoryTextView.text = counterHistory
            counterHistoryTextView.scrollRangeToVisible(NSRange(location: counterHistoryTextView.text.count - 1, length: 0))

        }
    }

    @IBOutlet weak var counterHistoryTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counter)
        counterHistoryTextView.text = counterHistory
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy/MM/dd HH:mm:ss")
        
        
        // Do any additional setup after loading the view.
    }
    
    
  

    @IBAction func resetButtonPressed() {
        counter = 0

        counterHistory +=
            "\n" + "[\(dateFormatter.string(from: Date.now))]" + resetText

    }

    @IBAction func addButtonPressed() {
        counter += 1

        counterHistory +=
            "\n" + "[\(dateFormatter.string(from: Date.now))]" + incrementText

    }

    @IBAction func minusButtonPressed() {
        if counter > 0 {
            counter -= 1
            counterHistory +=
                "\n" + "[\(dateFormatter.string(from: Date.now))]"
                + dicrementText
        } else {
            counterHistory +=
                "\n" + "[\(dateFormatter.string(from: Date.now))]"
                + invalidActionText
        }
    }
}
