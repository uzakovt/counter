import Foundation
import UIKit

final class ViewController: UIViewController {
    private let incrementText: String = " значение изменено на +1"
    private let dicrementText: String = " значение изменено на -1"
    private let resetText: String = " значение сброшено"
    private let invalidActionText: String = "попытка уменьшить значение счётчика ниже 0"
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

    @IBOutlet private weak var counterHistoryTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counter)
        counterHistoryTextView.text = counterHistory
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy/MM/dd HH:mm:ss")
    }
    
    @IBAction private func resetButtonPressed() {
        counter = 0
        counterHistory +=
            "\n" + "[\(dateFormatter.string(from: Date.now))]" + resetText
    }

    @IBAction private func addButtonPressed() {
        counter += 1
        counterHistory +=
            "\n" + "[\(dateFormatter.string(from: Date.now))]" + incrementText
    }

    @IBAction private func minusButtonPressed() {
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
