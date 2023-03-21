//
//  timerViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 19.01.2023.
//

import UIKit

class timerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var timer1Lbl: UILabel!
    
    @IBOutlet weak var timer2Lbl: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var liste = ["Eleman 1","Eleman 2","Eleman 3","Eleman 4","Eleman 5","Eleman 6","Eleman 7","Eleman 8"]
    var liste2 = ["E 1","E 2","E 3","E 4","E 5","E 6","E 7","E 8"]
    
    var timer : Timer?
    let timerSure = 3.0
    var sayac = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //timer = Timer.scheduledTimer(withTimeInterval: timerSure, repeats: true, block: zamanSonu)
        
        //2nci çeşit timer
        timer = Timer.scheduledTimer(timeInterval: timerSure, target: self, selector: #selector(zamanSonu2), userInfo: nil, repeats: true)
        
        //listelerde default olarak seçili geleni değiştirebiliriz
        //incomponent yani index 0 dan başlıyor 1nci listede 2 2nci listede 4ncü eleman seçili gelecek
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(3, inComponent: 1, animated: true)
    }
    
    func zamanSonu(t : Timer){
        //repeats true olduğu için bu 3 sn de bir sonsuza kadar tekrar eder
        sayac += 1
        timer2Lbl?.text = "3sn geçti: "+String (sayac)
        
        //5 den sonra deaktif olsun
        if sayac == 5 {
            timer?.invalidate()
        }
        
    }
    @objc func zamanSonu2(t : Timer){
        //repeats true olduğu için bu 3 sn de bir sonsuza kadar tekrar eder
        sayac += 1
        timer2Lbl?.text = "3sn geçti: "+String (sayac)
        
        //5 den sonra deaktif olsun
        if sayac == 5 {
            timer?.invalidate()
        }
        
    }
    
    @IBAction func btnYenidenYukle(_ sender: Any) {
        //Liste işlemlerini picker view ile yapıyoruz.View controller'ın picker view üzerinde değişiklik yapma yetkisi yoktur bunu yapabilmesi için picker view üzerine sağ tıklayıp view controller üzerine(header kısmındaki burada item1) bırakıyor ve data source ile delegate'in seçili olduğundan emin oluyoruz yani bunları seçili olmalı!
        //yukarıda clss alanında UIPickerViewDelegate, UIPickerViewDataSource ekliyoruz ve aşağıdaki 2 fonksiyonu yine ekliyoruz biri component sayısı diğeri ise component içinde kaç eleman olacağını veriyor
        //func pickerView ve numberOfComponents fonksiyonları
        //bundan sonra ise 3ncü fonksyinu yine pickerView olarak listenin içini doldurmak için ekliyoruz burada farklı seçnekler var biz burda string,attribute olanını seçtik
        
        liste.remove(at: 3) //4ncü elemanı silip tekrar yükleyelim
        pickerView.reloadAllComponents()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return liste.count
        }
        
        return liste2.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return 1
        //artık liste 2 tane olduğu için dönen component 2 tane
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if component == 0 {
            return NSAttributedString(string: liste[row], attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red])
        }
        
        
        return NSAttributedString(string: liste2[row], attributes: [NSAttributedString.Key.foregroundColor  : UIColor.blue])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            print(liste[row])
        } else{
            
            print(liste2[row])
        }
        
        
    }
    
    
}
