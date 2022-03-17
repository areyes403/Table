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
    @IBOutlet weak var imgCalificacion: UIImageView!
    var recibirNombre: String?
    var recibirCalificacion:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text=recibirNombre ?? ""
        print(recibirCalificacion)
        if recibirCalificacion ?? 0 >= 70 {
            lblCalificacion.text = "Calificacion : "+String(recibirCalificacion ?? 0)+" FELICIDADES!!"
            imgCalificacion.image = UIImage(named: "aprobado")
        }else{
            lblCalificacion.text = "Calificacion :"+String(recibirCalificacion ?? 0)+" Echele mas ganas mijo!!"
            imgCalificacion.image = UIImage(named: "reprobado")
        }
        
        
        
        

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
