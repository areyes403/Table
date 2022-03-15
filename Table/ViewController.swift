//
//  ViewController.swift
//  Table
//
//  Created by mac17 on 14/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableItems: UITableView!
    var nombre:String?
    
    let alumnos = ["Fernando", "Jose", "Sahid"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableItems.delegate = self
        tableItems.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Nuevo contacto", message: "Agregar", preferredStyle: .alert)
        
        //crear textfield
        alert.addTextField{
            nombreAlerta in
            nombreAlerta.placeholder="Escribe un nuevo alumno"
            
        }
        
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default){ _ in
            print("Alumno agregado")
        }
        
        alert.addAction(accionAceptar)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableItems.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = alumnos[indexPath.row]
        celda.detailTextLabel?.text = "Esto es una prueba"
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(alumnos[indexPath.row])
        nombre=alumnos[indexPath.row]
        //Enviar datos a segunda view
        performSegue(withIdentifier: "enviarNombre", sender: self )
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarNombre"{
            let objDestino=segue.destination as! detailedViewController
            objDestino.recibirNombre = nombre
            
        }
        
    }
}

