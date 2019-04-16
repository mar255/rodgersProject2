//
//  TaskViewController.swift
//  taskApp
//
//  Created by Rodgers, Michael A on 4/15/19.
//  Copyright © 2019 Rodgers, Michael A. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let items = ["Low", "Medium", "High"]
    var selection:String!
    
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var myImage: UIImageView!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = items[row]
        global.pickerVar = selection
    }
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBAction func addItem(_ sender: Any) {
        if(input.text != "")
        {
            list.append(input.text! + "   " + "—" + "   " + selection)
            input.text = ""
            myImage.image = UIImage(named: "success")
        }
        else {
            myImage.image = UIImage(named: "failure")
        }
        selectedLabel.text = "Task Submitted"
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
