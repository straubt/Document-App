//
//  DocumentViewController.swift
//  Document App
//
//  Created by Titouan STRAUB on 1/17/24.
//

import UIKit

class DocumentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = imageName {
            self.imageView.image = UIImage(named: image)
        }
        // Do any additional setup after loading the view.
    }
    var imageName: String?
    @IBOutlet weak var imageView: UIImageView!
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
