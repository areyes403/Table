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
    var calificacion:String?
    
    var alumnoSeleccionado: String?
    
    var alumnos = [
        Alumno(nombre: "Abraham", calificacion: 100),
        Alumno(nombre: "Eric", calificacion: 90),
        Alumno(nombre: "Sahid", calificacion: 80)
    ]
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
        alert.addTextField{
            nombreAlerta in
            nombreAlerta.keyboardType = .numberPad
            nombreAlerta.placeholder="calificacion"
            
        }
        let accionAceptar = UIAlertAction(title: "Aceptar", style: .default){ _ in
            print("Alumno agregado")
            guard let nombreAlumno = alert.textFields?.first?.text else {return}
            guard let calificacion = alert.textFields?[1].text else {return}
            
            let  nuevoAlumno = Alumno(nombre: nombreAlumno, calificacion: Int(calificacion) ?? 0)
            self.alumnos.append(nuevoAlumno)
            //self.alumnos.append(calificacion)
            self.tableItems.reloadData()
            
        }
        
        let accionCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alert.addAction(accionAceptar)
        alert.addAction(accionCancelar)
        present(alert, animated: true, completion: nil)
    }
    
    //seleccionar elemento
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableItems.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = alumnos[indexPath.row].nombre
        var cali=alumnos[indexPath.row].calificacion
        celda.detailTextLabel?.text = "Calificacion :"
        return celda
    }
    
    //eliminar elemento
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("nombre eliminado")
            alumnos.remove(at: indexPath.row)
            print(alumnos)
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(alumnos[indexPath.row])
        nombre=alumnos[indexPath.row].nombre
        alumnoSeleccionado = alumnos[indexPath.row].nombre
    
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

