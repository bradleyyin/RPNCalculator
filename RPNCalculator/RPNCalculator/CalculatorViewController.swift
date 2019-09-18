//
//  CalculatorViewController.swift
//  RPNCalculator
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit
import RPN

class CalculatorViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 20
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 20    // don't round!
        //        formatter.alwaysShowsDecimalSeparator
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()
    
    private var calculator = Calculator() {
        didSet {
            guard let value = calculator.topValue else { return }
            
            textField.text = numberFormatter.string(from: value as NSNumber)
            updateViews()
        }
    }
    
    private var digitAccumulator = DigitAccumulator() {
        didSet {
            // Don't format, we want to show keys as typed (0.002)
            // Otherwise decimal doesn't display properly
            textField.text = digitAccumulator.stringValue
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews() {
        
    }
    
    func addNumber() {
        // TODO: Test nil condition for accumulator
        guard let value = digitAccumulator.value else { return }
        
        calculator.push(number: value)
        
        digitAccumulator.clear()
        textField.text = numberFormatter.string(from: value as NSNumber) // Reset the text to give feedback of what was entered (with decimal)
        print(calculator)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        calculator.clear()
        digitAccumulator.clear()
    }
    
    @IBAction func decimalButtonTapped(_ sender: UIButton) {
        try? digitAccumulator.add(.decimalPoint)
    }
    
    @IBAction func divideButtonTapped(_ sender: UIButton) {
        addNumber()
        calculator.push(operator: .divide)
    }
    
    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        addNumber()
        calculator.push(operator: .multiply)
    }
    
    @IBAction func subtractButtonTapped(_ sender: UIButton) {
        addNumber()
        calculator.push(operator: .subtract)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        addNumber()
        calculator.push(operator: .add)
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        try? digitAccumulator.add(.number(sender.tag))
    }
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        addNumber()
    }
}
