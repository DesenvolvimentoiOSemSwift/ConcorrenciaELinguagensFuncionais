
//
//  ViewController.swift
//  GCD-class
//
//  Created by Xanda Aguiar on 05/09/14.
//  Copyright (c) 2014 iTunesU-PoA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var lblTexto: UILabel!
    @IBOutlet weak var odds: UITextView!
    @IBOutlet weak var even: UITextView!
    
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
          
        
    }
    
    
    

    override func viewDidAppear(animated: Bool) {
        
        var numbers = [0]
        
        for (var i=1;i<10000;i++)
        {
            numbers+=[i]
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), {
            let odds    = numbers.filter { $0 % 2 == 1 }
            dispatch_async(dispatch_get_main_queue()){
                self.odds.text = "\(odds)"
            }
        })
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), {
            let even    = numbers.filter { $0 % 2 == 0 }
            dispatch_async(dispatch_get_main_queue()){
                self.even.text = "\(even)"
            }
        })
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

