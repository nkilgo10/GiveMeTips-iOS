//
//  ResultViewController.swift
//  GiveMeTips-iOS
//
//  Created by ibg training 5 on 12/10/20.
//  Copyright © 2020 ibg training 5. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var total: String?
    var settings: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = settings
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
