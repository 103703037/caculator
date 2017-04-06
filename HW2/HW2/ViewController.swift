//
//  ViewController.swift
//  HW2
//
//  Created by lisa on 2017/4/5.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var displayLebel: UILabel!
    var currentCount="0"{
        didSet{ //當currentCount的值有改變的時候，會觸發
            
            self.displayLebel.text=self.currentCount
        }
    }
    var temp = ""
   
    var cal = ""
    @IBAction func piButton(_ sender: Any) {
        currentCount = String(Double.pi)
    }
    @IBAction func expButton(_ sender: Any) {
        currentCount = String(exp(1.0))
    }
    @IBAction func change_negative(_ sender: Any) {
        if(currentCount.contains(".")){
            currentCount = String(-1 * Double(currentCount)!)
        }
        else{
            currentCount = String(-1 * Int(currentCount)!)
        }
    }
    @IBAction func log_button(_ sender: Any) {
        currentCount = String(log10(Double(currentCount)!))
    }
    @IBAction func percentage(_ sender: Any) {
        currentCount = String(Double(currentCount)! / 100)
    }
    @IBAction func resetButton(_ sender: Any) {
        self.currentCount = "0"
        temp = ""
        cal = ""
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        let numericButtonDigit = sender.tag
        if currentCount == "0"{
            currentCount = String(numericButtonDigit)
        }
        else{
            currentCount.append(String(numericButtonDigit))
        }
    }
    
    @IBAction func dotButton(_ sender: Any) {
        if(currentCount.contains(".")){return}
        else{
            currentCount.append(".")
        }
    }
    
    @IBAction func equal_button(_ sender: Any) {
        switch cal {
            case "add":
                self.addButton(sender)
            case "decrease":
                self.decreaseButton(sender)
            case "multi":
                self.multiButton(sender)
            case "divide":
                self.divideButton(sender)
            case "power":
                self.power(sender)
            case "root":
                self.root(sender)
            default:
                print()
        }
        if(temp == ""){}
        else{
            currentCount = String(temp)
        }
        temp = ""
        cal = ""
    }
    
       @IBAction func decreaseButton(_ sender: Any) {
        if cal != "" && cal != "decrease"{
            switch cal {
            case "add":
                self.addButton(sender)
            case "power":
                self.power(sender)
            case "multi":
                self.multiButton(sender)
            case "divide":
                self.divideButton(sender)
            case "root":
                self.root(sender)
            default:
                print()
            }
            cal = ""
        }
        
        if temp == ""{
            temp = String(currentCount)
            
        }//
        else if cal == ""{} //還沒輸入完畢，等待
        else{
            //print(temp)
            if temp.contains(".") || currentCount.contains("."){
                
                let num = (Double(temp)! - Double(currentCount)!)
                if(num.truncatingRemainder(dividingBy:1) != 0){
                    temp = String(num)
                }
                else{
                    temp = String(Int(num))
                }
            }
            else{
                temp = (String(Int(temp)! - Int(currentCount)!))
            }
            
          //  print(temp)
        }
        currentCount = "0"
        cal = "decrease"
    }
    @IBAction func addButton(_ sender: Any) {
        if cal != "" && cal != "add"{
            switch cal {
            case "decrease":
                self.decreaseButton(sender)
            case "multi":
                self.multiButton(sender)
            case "divide":
                self.divideButton(sender)
            case "power":
                self.power(sender)
            case "root":
                self.root(sender)
            default:
                print()
            }
            cal = ""
        }
        if temp == "" {
            temp = String(currentCount)
            
        }
        else if cal == ""{}
        else{
            if temp.contains(".") || currentCount.contains("."){
                let num  = (Double(temp)! + Double(currentCount)!)
                if(num.truncatingRemainder(dividingBy:1) != 0){
                    temp = String(num)
                }
                else{
                    temp = String(Int(num))
                }
            }
            else{
                temp = (String(Int(temp)! + Int(currentCount)!))
            }
            //print(temp)
        }
        cal = "add"
        currentCount = "0"
    }
    @IBAction func multiButton(_ sender: Any) {
        if cal != "" && cal != "multi"{
            switch cal {
            case "add":
                self.addButton(sender)
            case "decrease":
                self.decreaseButton(sender)
            case "power":
                self.power(sender)
            case "divide":
                self.divideButton(sender)
            case "root":
                self.root(sender)
            default:
                print()
            }
            cal = ""
        }
        
        if temp == "" {
            temp = String(currentCount)
        }
        else if cal == ""{}
        else{
            if temp.contains(".") || currentCount.contains("."){
                let num = (Double(temp)! * Double(currentCount)!)
                if(num.truncatingRemainder(dividingBy:1) != 0){
                    temp = String(num)
                }
                else{
                    temp = String(Int(num))
                }
            }
            else{
                temp = (String(Int(temp)! * Int(currentCount)!))
            }
           // print(temp)
        }
        cal = "multi"
        currentCount = "0"
    }
    @IBAction func divideButton(_ sender: Any) {
        if cal != "" && cal != "divide"{
            switch cal {
            case "add":
                self.addButton(sender)
            case "decrease":
                self.decreaseButton(sender)
            case "multi":
                self.multiButton(sender)
            case "power":
                self.power(sender)
            case "root":
                self.root(sender)
            default:
                print()
            }
            cal = ""
        }
        
        if temp == ""{
            temp = String(currentCount)
            
        }
        else if cal == ""{}
        else{
            guard currentCount != "0" && currentCount != "0.0" else {
                return
            }
            if temp.contains(".") || currentCount.contains("."){
                temp = (String(Double(temp)! / Double(currentCount)!))
            }
            else{
                if Int(temp)! % Int(currentCount)! == 0{
                    temp = (String(Int(temp)! / Int(currentCount)!))
                }
                else{
                    temp = (String(Double(temp)! / Double(currentCount)!))
                }
            }
        }
        cal = "divide"
        currentCount = "0"
    }
    @IBAction func power(_ sender: Any) {
        if cal != "" && cal != "power"{
            switch cal {
            case "add":
                self.addButton(sender)
            case "decrease":
                self.decreaseButton(sender)
            case "multi":
                self.multiButton(sender)
            case "divide":
                self.divideButton(sender)
            case "root":
                self.root(sender)
            default:
                print()
            }
            cal = ""
        }
        
        if temp == "" {
            temp = String(currentCount)
            
        }
        else if cal == ""{}
        else{
            let num = pow(Double(temp)! , Double(currentCount)!)
            if(num.truncatingRemainder(dividingBy:1) != 0){
                temp = String(num)
            }
            else{
                temp = String(Int(num))
            }
        }
        cal = "power"
        currentCount = "0"
    }
    @IBAction func root(_ sender: Any) {
        if cal != "" && cal != "root"{
            switch cal {
            case "add":
                self.addButton(sender)
            case "decrease":
                self.decreaseButton(sender)
            case "multi":
                self.multiButton(sender)
            case "divide":
                self.divideButton(sender)
            case "power":
                self.power(sender)
            default:
                print()
            }
            cal = ""
        }
        if temp == "" {
            temp = String(currentCount)
            
        }
        else if cal == ""{return}
        else{
            let num = pow(Double(temp)! , 1.0 / Double(currentCount)!)
            if(num.truncatingRemainder(dividingBy:1) != 0){
                temp = String(num)
            }
            else{
                temp = String(Int(num))
            }
        }
        cal = "root"
        currentCount = "0"
    }
}

