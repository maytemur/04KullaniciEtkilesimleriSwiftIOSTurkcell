//
//  TabBarViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 16.01.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    @IBOutlet var tabBarViewOzel: UIView!
    
    @IBOutlet weak var btnEkran1: UIButton!
    
    @IBOutlet weak var btnEkran2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Normalde bu kadar basit 2 button için tabbar custom yapmaya gerek yok örnek olsun diye yaptı. TabBar seçili iken view nesnesini barın üstüne sürükleyip bırakıyoruz daha sonra buttonların vs her ne ise custom tasarımların constraintlerini veriyoruz. Bu işlem bittikten sonra cocoa touch class ile UITabBarClass subclass'ı olacak şekilde yeni bir class yaratıp TabBarViewController'ı ona bağlıyoruz. Şu anki bu dosya yani.
        //Bu özel tasarımın tabBarView içinde gözükmesi için sol taraftaki Tab Bar View Controller Scene altındaki View'ın ve butonların outlet'lerini sürükleyip yukarıya bırakarak oluşturuyoruz.
        
        view.addSubview(tabBarViewOzel)
        
        tabBarViewOzel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBarViewOzel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 34),
            tabBarViewOzel.heightAnchor.constraint(equalToConstant: 104),
            tabBarViewOzel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            tabBarViewOzel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0)
            //IphoneX den itibaren aşağıdaki boşluk 34 pixel ama tercih bizim
            
        ])
        
        //ilk açıldığında 1nci tab seçili olsun
        Degistir(tabIndex: 0)
        
    }
    //Butonların isimlerini Ekran1 ve 2 olarak değiştirdik. TabView butonları indexlerine göre algılıyor. Butonların tag değerini 0 ve 1 olarak değiştirdik
    
    @IBAction func TabDegistir(_ sender: Any) {
        //butona özgü bir olay değil 2nci buton içinde bu çalışacak
        //bu yüzden 2 butonuda sürükleyip buraya bırakıyoruz
        let index = (sender as! UIButton).tag
        Degistir(tabIndex: index)
    }
    
    func Degistir(tabIndex : Int){
        btnEkran1.backgroundColor = .clear
        btnEkran2.backgroundColor = .clear
        //2sinide temizleyelim hangisinin seçildiğini bilmiyoruz
        switch tabIndex {
            
        case 0:
            btnEkran1.backgroundColor = .blue
        case 1:
            btnEkran2.backgroundColor = .blue
        default:
            btnEkran1.backgroundColor = .blue
        }
        
        selectedIndex = tabIndex
        
        
    }
    
    
}
