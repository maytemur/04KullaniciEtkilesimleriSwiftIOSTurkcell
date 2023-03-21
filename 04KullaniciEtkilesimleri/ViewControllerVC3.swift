//
//  ViewControllerVC3.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 12.01.2023.
//

import UIKit

class ViewControllerVC3: UIViewController {

    @IBOutlet weak var ustHeader: UINavigationItem!
    @IBOutlet weak var centerText: UITextView!
    
    @IBOutlet weak var ustView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //auto layout yaparken constraintleri öncelikle aktive etmemiz gerekiyor ve translate auto değerini false yapmamız gerekiyor
        
        ustView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(    [
            
            ustView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            //buradaki view viewController'ı ana view'ı temsil ediyor
            ustView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0),
            ustView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0),
            ustView.heightAnchor.constraint(equalToConstant: 100)
        ]
        )
        
        //centerText'i ekranın tam ortasında ortalayalım
        centerText.translatesAutoresizingMaskIntoConstraints = false
        
        centerText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerText.heightAnchor.constraint(equalToConstant: 120).isActive = true
        centerText.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        
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
