//
//  ViewController.swift
//  calculator
//
//  Created by 許廷綺 on 2018/6/10.
//  Copyright © 2018 許廷綺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var registerShow: UILabel!
    @IBOutlet weak var resultShow: UILabel!
    @IBOutlet weak var cBtn: UIButton!
    @IBOutlet weak var divideBtn: UIButton!
    @IBOutlet weak var multiBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var equalBtn: UIButton!
    @IBOutlet weak var n7Btn: UIButton!
    @IBOutlet weak var n8Btn: UIButton!
    @IBOutlet weak var n9Btn: UIButton!
    @IBOutlet weak var n4Btn: UIButton!
    @IBOutlet weak var n5Btn: UIButton!
    @IBOutlet weak var n6Btn: UIButton!
    @IBOutlet weak var n1Btn: UIButton!
    @IBOutlet weak var n2Btn: UIButton!
    @IBOutlet weak var n3Btn: UIButton!
    @IBOutlet weak var n0Btn: UIButton!
    
    var inputString: String = "" {
        didSet {
            registerShow.text = inputString
        }
    }
    var tempNumberString: String = ""
    var operatorString: String = ""
    var result: Float? = nil {
        didSet {
            resultShow.text = "\(result ?? 0)"
        }
    }
    var nextNumber: Float? = nil
    
    @IBAction func cancelBtnClick(_ sender: UIButton) {
        inputString = ""
        tempNumberString = ""
        operatorString = ""
        result = nil
        nextNumber = nil
    }
    
    @IBAction func numBtnClick(_ sender: UIButton) {
        inputString.append((String)(sender.tag))
        tempNumberString+="\(sender.tag)"
        if operatorString == "="{
            operatorString = ""
            result = nil
        }
    }
    
    
    @IBAction func OperateBtnClick(_ sender: UIButton) {
    
        guard let operatorStr = sender.currentTitle else {
            return
        }
        inputString += operatorStr
        guard let number = Float(tempNumberString) else{
            print("process number failed...")
            operatorString = operatorStr
            return
        }
        tempNumberString = ""
        if result == nil{
            result = number
            nextNumber = 0
            
        }else{
            nextNumber = number
        }
        print("result:\(String(describing: result)) nextNumber:\(nextNumber!) operatorStr:\(operatorStr)")
        switch operatorStr {
        case "+":
            result = result! + nextNumber!
            break
        case "-":
            result = result! - nextNumber!
            break
        case "X":
//            result = result! * nextNumber!
            break
        case "/":
//            if nextNumber == 0 {return}
//            result = result! / nextNumber!
            break
    
        default:
            break
        }
        print("result:\(String(describing: result)) nextNumber:\(nextNumber!) operatorStr:\(operatorStr)")
        operatorString = operatorStr
    }
    
    @IBAction func equalBtnClick(_ sender: Any) {
        
//        guard let operatorStr = (sender as AnyObject).currentTitle else {
//            return
//        }
//        inputString += operatorStr!
        guard let number = Float(tempNumberString) else{
            print("process number failed...")
            return
        }
        tempNumberString = ""
        if result == nil{
            result = number
            nextNumber = 0
            
        }else{
            nextNumber = number
        }
        print("result:\(String(describing: result)) nextNumber:\(nextNumber!) operatorStr:\(operatorString)")

        switch operatorString {
        case "+":
            result = result! + nextNumber!
            break
        case "-":
            result = result! - nextNumber!
            break
        case "X":
            result = result! * nextNumber!
            break
        case "/":
            if nextNumber == 0 {return}
            result = result! / nextNumber!
            break
            
        default:
            break
        }
        
        inputString += "=\(result!)\n"
        
        operatorString = "="
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

