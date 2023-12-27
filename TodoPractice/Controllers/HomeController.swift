//
//  HomeController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/17.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         let sampleImage = UIImage(named: "Liverpool")
         homeImage.image = sampleImage

        // Do any additional setup after loading the view.
    }
    
    @IBAction func moveRegisterPricePage(_ sender: UIButton) {
        print("moveRegisterPricePage")
        self.performSegue(withIdentifier: "RegisterMoneyPage", sender: self)
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {

    }
}
