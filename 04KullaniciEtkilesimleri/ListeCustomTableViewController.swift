//
//  ListeCustomTableViewController.swift
//  04KullaniciEtkilesimleri
//
//  Created by maytemur on 1.02.2023.

//burda table view görüntüsünün şablonunu yapıyoruz yani boyut sabit değil değişebilir table view içeriğine göre değişecektir

//hazır gelen table view cell yerine yeni bir tableview cell dosyası yaratıp onun üzerinde custom olmasını sağlayacağız çünkü hazır gelen tableview cell üzerine 1 tane imageview ve 1 tanede label ekledik bunların arkasında çalışacak table view cell dosyası standart harici oluyor
//bunu yapabilmek için aradaki menüde(document outline) Table View altında table view seçili iken class dosyasını yarattığımız table view cell olarak değiştiriyoruz burası önemli!
//outlet'leri muhakkak listecustom tableview cell içine eklememiz gerekiyor xcode bazen bunu otomatik olarak getiriyebiliyor!!!
//bazen diyor ama bence getirmiyordur :)

//adını listecustom table view cell olarak verdim
//sonrasında bu dosyaya erişebilrmek için identifier veriyoruz bunuda customsatir olarak verdim

import UIKit

class ListeCustomTableViewController: UITableViewController {

    var listeCustom = ["Custom Eleman1","Custom Eleman2","Custom Eleman3","Custom Eleman4","Custom Eleman5","Custom Eleman6","Custom Eleman7","Custom Eleman8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listeCustom.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customsatir", for: indexPath) as! ListeCustomTableViewCell
        
        //custom cell'imizden bir tane oluşturduk

        // Configure the cell...
        cell.lblMetin.text = listeCustom[indexPath.row]
        
        //cell custom olduğu için image tam olarak satırda çıkmadı bunun için data outline kısmında customsatır seçili iken row height'ına bakıyoruz bende bu 67 ve table view komple seçili iken satır yüksekliğini yeterince artırıyoruz böylece custom yükseklik ve içerikle table view cell yapmış olduk
        //ayrıca ayrıntılar kısmında seperator ayarınıda single line etched olarak değiştirdim rengini kırmızı yaptım daha fiyakalı oldu! istenilirse buradan aradaki çizgi kaldırılabilir

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
