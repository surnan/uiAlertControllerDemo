//
//  ViewController.swift
//  projectwo
//
//  Created by admin on 1/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func alert2(_ sender: UIButton) {
        //Dialog with one input textField & two buttons
        let alert=UIAlertController(title: "Alert 2", message: "Two will win too", preferredStyle: UIAlertControllerStyle.alert);

        
        alert.addTextField(configurationHandler: nil);
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil));
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            let fields = alert.textFields!;
            print("Yes we can: "+fields[0].text!);
        }));
        present(alert, animated: true, completion: nil);
    }
    
    
    @IBAction func alert1(_ sender: UIButton) {
        let alert=UIAlertController(title: "Alert 1", message: "One has won", preferredStyle: UIAlertControllerStyle.alert);
        show(alert, sender: self);
    }
    
    @IBAction func alert3(_ sender: UIButton) {
        // one input & one button
        let alert=UIAlertController(title: "Alert 3", message: "Three will set me free", preferredStyle: UIAlertControllerStyle.alert);
        
        //configured input textField
        var field:UITextField?;// operator ? because it's been initialized later
        alert.addTextField(configurationHandler:{(input:UITextField)in
            input.placeholder="I am displayed, when there is no value ;-)";
            input.clearButtonMode=UITextFieldViewMode.whileEditing;
            field=input;//assign to outside variable(for later reference)
        });
        //alert3 yesHandler -> defined in the same scope with alert, and passed as event handler later
        func yesHandler(actionTarget: UIAlertAction){
            print("YES -> !!");
            //print text from 'field' which refer to relevant input now
            print(field!.text!);//operator ! because it's Optional here
        }
        //event handler with predefined function
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: yesHandler));
        present(alert, animated: true, completion: nil);
    }
}

