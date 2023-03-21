//
//  kameraViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 21.01.2023.
//

import UIKit
import AVFoundation //bunun içinde izin kontrollerini yapabileceğiz
class kameraViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var ivArkaPlan: UIImageView!
    //imageview arkaplan
    
    @IBOutlet weak var galeriImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnKameraAc(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            var imagePicker = UIImagePickerController()
            
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
            
            //yalnız burada simülasyonun kamera özelliği yok gerçk telefon kullanmamız gerekiyor
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //aldığımız resmi ivarkaplan'a atayalım
        ivArkaPlan.image = image
        dismiss(animated: true, completion: nil)
        
        //galeriden aldığımız nesneyi atayalım
        galeriImage.image = image
        dismiss(animated: true, completion: nil)
        //burada alına resim let image ile 1 kere çalıştığından diğer resim arka planıda değişiyor
        
    }
    
    //gerekli izinleri kontrol edelim
    
    func KameraKontrol(){
        let durum = AVCaptureDevice.authorizationStatus(for: .video)
        //video açmak için case ler oluşturduk kullanıcı red edebilir .denied kabul edebilir .authorized izin vermemiş olabilir .restiricted vs gibi durumları ele aldık
        //bunları bu şekilde ayrı ayrı göstermek için oluşturmuş ,sadece authorized ele alınıp diğer durumlar için tek bir case gibi default diyerek uyarı gösterebilirdik
        
        switch  durum {
        case .notDetermined:
            KameraAc()
        case .restricted:
            UyariGoster()
        case .denied:
            UyariGoster()
        case .authorized:
            KameraAc()
            
        @unknown default:
            print("Hata")
        }
    }
    
    func UyariGoster(){
        let baslik = "Kameraya erişilemiyor"
        let mesaj = "Erişimi sağlamak için ayarlardan kamera erişimini açmalısınız"
        let alert = UIAlertController(title: baslik, message: mesaj, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Ayarlar", style: .default, handler: AyarlarAc))
        
        present(alert, animated: true, completion: nil)
    }
    
    func AyarlarAc(alert : UIAlertAction){
        guard let ayarlarURL = URL(string: UIApplication.openSettingsURLString) else {return}
        //burada return değilde kullanıcıya ayarlar'a gidilemiyor bir hata oluştu diyebiliriz
        //buraya geldiyse ayarları almışız demektir.
        //IOS 10 ve sonrasında ayarları alma değişti bu yüzden versiyon kontrolüde yapacağız
        if UIApplication.shared.canOpenURL(ayarlarURL){
            if #available(iOS 10.0, *){
                UIApplication.shared.open(ayarlarURL, completionHandler: nil)
            } else{
                UIApplication.shared.openURL(ayarlarURL)
            }
        }
        
    }
    func KameraAc(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //image Galeri açma işlemi kamera açma işlemine çok benziyor
    
    @IBAction func btnGaleriAc(_ sender: Any) {
        GaleriAc()
    }
    
    func GaleriAc(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    //class olarak UIImagePickerControllerDelegate ve UINavigationControllerDelegate yine kamerada olduğu gibi ekleniyor ve yine aldığımız nesneyi ki kameradan tek farkı bu sefer sourceType photoLibrary dedik.
    //yukarıda kamera için yazılı olduğu için burda tekrar eklemedik
    //aldığımız nesneyi seçilen resmi yine imagePickerController içinde gösterelim yukarıda gerekli ekleme yapıldı
    
    
    
}
