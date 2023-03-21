//
//  toDetailsVC.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 13.01.2023.
//

import UIKit

//AutoLayout devam-
//ekranda kullanıcı adı ve şifre textfield'ları ve giriş yap butonu olacak, giriş ekranı ekranın ortasına yakın olacak



class toDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tfKullaniciAdi = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tfKullaniciAdi.placeholder = "Kullanıcı Adını giriniz"
        tfKullaniciAdi.backgroundColor = .white
        tfKullaniciAdi.borderStyle = .roundedRect
        tfKullaniciAdi.textColor = .black
        tfKullaniciAdi.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfKullaniciAdi)
        
        //2nci tect field'da aynı olacağı için kopyalayıp yapıştırıyoruz
        
        let tfSifre = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tfSifre.placeholder = "Şifrenizi giriniz"
        tfSifre.backgroundColor = .white
        tfSifre.borderStyle = .roundedRect
        tfSifre.textColor = .black
        tfSifre.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfSifre)
        
        let btnGirisYap = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //buradaki frame değerlerini artık istersek kaldırabiliriz çünkü aşağıda constraintleri verdik
        btnGirisYap.setTitle("Giriş Yap", for: .normal)
        btnGirisYap.backgroundColor = .blue
        btnGirisYap.titleLabel?.textColor = .black
        btnGirisYap.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(btnGirisYap)
        
        //şu an constraintleri vermedik ama hata vermez sadece ekranda sol üst köşede üst üste gösteriyor
                
        
        tfKullaniciAdi.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tfKullaniciAdi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tfKullaniciAdi.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -150),
            //constant -150 yani ortasından bu kadar yukarıda olacak
            tfKullaniciAdi.heightAnchor.constraint(equalToConstant: 50),
            tfKullaniciAdi.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.8)
            //multiplier : yani ekranın yüzde 80ni ni kaplasın dedik
            
            ])
        
        //diğerlerini kullanıcı adının altına doğru hizalayacağız
        
        tfSifre.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            tfSifre.topAnchor.constraint(equalTo: tfKullaniciAdi.bottomAnchor,constant: 10),
            tfSifre.leadingAnchor.constraint(equalTo: tfKullaniciAdi.leadingAnchor,constant: 0),
            tfSifre.trailingAnchor.constraint(equalTo: tfKullaniciAdi.trailingAnchor,constant: 0),
            tfSifre.heightAnchor.constraint(equalTo: tfKullaniciAdi.heightAnchor,constant: 0)
        
        ])
        
        btnGirisYap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            btnGirisYap.topAnchor.constraint(equalTo: tfSifre.bottomAnchor,constant: 10),
            btnGirisYap.leadingAnchor.constraint(equalTo: tfSifre.leadingAnchor,constant: 0),
            btnGirisYap.trailingAnchor.constraint(equalTo: tfSifre.trailingAnchor,constant: 0),
            btnGirisYap.heightAnchor.constraint(equalTo: tfSifre.heightAnchor,constant: 0)        
        ])
        
        

    }
    

}
