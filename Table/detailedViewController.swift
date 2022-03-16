//
//  detailedViewController.swift
//  Table
//
//  Created by mac17 on 14/03/22.
//

import UIKit

class detailedViewController: UIViewController {

    @IBOutlet weak var lblCalificacion: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    
    var recibirNombre: String?
    var recibirCalificacion:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text=recibirNombre ?? ""
        

        // Do any additional setup after loading the view.
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
