//
//  ViewControllerWithTableViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 2.02.2023.
//

import UIKit

class ViewControllerWithTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
 
//Normalde table view controller'ı böyle bütün ekranı kaplayacak şekilde değilde ekranın bir kısmında olacak şekilde kullanırız dedi yani heryerde herzaman recycleview controller ekranın heryerinde olacak şekilde kullanılmıyormuş!
//bunu yapabilmek için normal viewcontroller içine table view ekledik ve bunun üzerine segue oluşturur gibi ctrl ile tıklayarak üerindeki view controller header baş kısmı üzerinde bıraktık.
//Sırasıyla DataSource ve Delegate'i seçiyoruz, PrefetchDatasource kısmını seçmiyoruz bu şekilde yaparak table view'ı view controller'a bağlamış olduk
//sonra bu dosya üzerinde class başında viewdelegate ve tableviewdatasource protokollerini ekliyoruz sonrasında verdiği hataya fix diyerek ilgili metodlarını aşağıya ekliyor ve içlerini dolduruyoruz
    
    //listemizi ekleyelim
    
    var listeTable = ["Custom Eleman1","Custom Eleman2","Custom Eleman3","Custom Eleman4","Custom Eleman5","Custom Eleman6","Custom Eleman7","Custom Eleman8"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = UITableViewCell()
        hucre.textLabel?.text = listeTable[indexPath.row]
        return hucre
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
