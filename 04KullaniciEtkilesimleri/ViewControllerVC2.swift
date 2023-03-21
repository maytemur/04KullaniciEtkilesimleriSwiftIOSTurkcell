//
//  ViewControllerVC2.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 8.01.2023.
//

import UIKit

class ViewControllerVC2: UIViewController {
    //var gelen : String?
    var gelen = ""
    //gelen diye optional olabilen bir string değişkeni yarattık
    
    var adSoyad : String?
    
    @IBOutlet weak var lblAdSoyad: UILabel!
    
    @IBOutlet weak var etiketLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //avigation barı tamamen kapatmak soldan ekranı scroll ederekde çekmek dahil geri dönülememesini istersek setNavigationBarHidden diyoruz
        navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
        etiketLbl.text = "1nci ekrandan gelen text : "+gelen
        
        lblAdSoyad.text = adSoyad
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //sadece bu view'de kapalı olmasını istersek bu metotta tekrar aktif ettiğimizde diğer view'larda aktif olmuş olur
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func btnGeriGit_TUI(_ sender: Any) {
        //butona basıldığında geri gitmesi için
        navigationController?.popViewController(animated: true)
    }
    
}
