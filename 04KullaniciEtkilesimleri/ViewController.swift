//
//  ViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 3.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblGiris: UILabel!
    @IBOutlet weak var btnDegistir: UIButton!
    
    @IBOutlet weak var lblEkranZamani: UILabel!
    
    @IBOutlet weak var btnTiklanmaZamani: UILabel!
    //dokunma ve sürükleme gibi işlemler için action nesnenin değerini okuma ve değiştirme gibi işlemler için outlet(@IBOutlet) oluşturuyoruz. Şİmdiye kadar oluşturduğumuz değişkenler strong'du bu ise weak. Labelların hafızada aldığı öncelik weak'dir unload işleminde ilk hafızadan düşen objelerdendir
    
    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfKod: UITextField!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblGiris.text = "değiştirildi"
        
        //eğer yukarıdaki super.loadView veya super.viewLoad'dan mnce herhangi bir değişiklik yapmaya kalkarsak hata alırız. super'ler yüklenmeden hiç bir outlet'imiz henüz oluşturulmadı
    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        //xcode otomatik olarak yardımcı oluyor ve buton'u yukarı eklersek outlet class içine eklersek action olarak ekleyeceğimizi düşünüyor. Butona normalde action versekde istersek outlet de verebiliriz ismini vs değiştirebiliriz
        print("butona tıklandı");
        
        btnDegistir.setTitle("titleLabel değişti", for: .normal)
        
        //örnek olarak ekranın açılış zamanını ve ekranda bulunan butona tıklanma zamanının ekranda gösterilmesi
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let str = ZamanGetir()
        lblEkranZamani.text = str
    }
    
    @IBAction func btnTikla(_ sender: Any) {
        
        btnTiklanmaZamani.text = ZamanGetir()
        
    }
    
    func ZamanGetir()-> String{
        
        var zaman = Date()
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyy HH:mm:ss"
        
        return df.string(from: zaman)
    }
    
    func AlertCikar() {
        let alertController = UIAlertController(title: "Başlık", message: "Uyarı Mesajı", preferredStyle: .alert)
        
        //uyarıyı gösterelim
        present(alertController, animated: true, completion: nil)
        
        //bu uyarıyı viewdidload içinde yaparsak hata verir çünkü viewdidload kullanıcı görmeden yükleniyor bu yüzden bunu viewDidAppear içinde çağıracağız yukarıdaki viewWillAppear'da olmaz çünkü oda kullanıcı görmeden hemen önce çalıştırılan metod
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default,handler: { UIAlertAction in
            print("Tamama basıldı")
        }))
        //handler da basıldığında bir olay gerçekleştirecekmiyiz bunu soruyor bunu ikinci buton ekleyip onun üstünde gösterdim. Handler üzerinde çift tıklayınca UIAlertAction lamda fonksiyonunu insert ediyor
        alertController.addAction(UIAlertAction(title: "Vazgeç", style: .default, handler: {
            UIAlertAction in
            print("Vazgeçe basıldı")
        }))
        //bu şekilde 3ncü ve daha fazla butonda ekleyebiliriz
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AlertCikar()
        //kullanıcı uyarıyı gördüğündede bunu yakalamamız gerekir bunun içinde alert kontrol üstüne örneğin bir tamam butonu koyabiliriz
        
    }
    
    @IBAction func gecSegue(_ sender: Any) {
    performSegue(withIdentifier: "todetailsVC", sender: nil)
    
    }
    
    @IBAction func btnGecIdentifier_TUI(_ sender: Any) {
        //TUI - bu kısaltmayı sürekli kullanıyor touch up inside in kisaltması
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let viewc = storybord.instantiateViewController(withIdentifier: "VC2") as! ViewControllerVC2
        viewc.gelen = "Storyboard Identifier ile Gelen"
        
        //burada karışıklıkları önlemek için class ismi ile storyboard ismini aynı kullanmak daha iyi olur dedi!
        
        //yine bu şekilde zaman alacak şekilde büyük veri gönderirsek 2nci ekranın açılması geçikir bu istenmeyen bir durumdur buna dikkat etmek gerekir
        
        
        
        
        present(viewc, animated: true)
        //completion kısmını sildik kullanmak zorudan değiliz
    }
    //veri taşıma işini segue ile çalışan prepare metodu ile yapıyoruz
    //segue işlemi gerçekleştikden sonra çalıştırılan metottur
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetailsVC" {
            let viewC2 = segue.destination as! ViewControllerVC2
            //segue'yi as! ViewControllerVC' yapmazsak gelen değişkeni çıkmaz
            
            viewC2.gelen = "Gönderilen değer"
            //bazı durumlarda bu gelen değerine ulaşamayabiliriz. Böyle durumlarda perform segue'deki sender:nil yerine sender:"Gönderilen değer" diyebiliriz
            
            viewC2.adSoyad = tfAd.text!+" " + tfSoyad.text!
        }
    }
    
    @IBAction func btnGec_TUI(_ sender: Any) {
        
        if tfKod.text == "123" {
            performSegue(withIdentifier: "todetailsVC", sender: nil)
        }
    }
  
}

