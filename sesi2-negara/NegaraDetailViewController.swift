//
//  NegaraDetailViewController.swift
//  sesi2-negara
//
//  Created by Dony Prastiya on 06/03/23.
//

import UIKit
import Kingfisher

class NegaraDetailViewController: UIViewController {
    @IBOutlet weak var populasi: UILabel!
    @IBOutlet weak var wilayah: UILabel!
    @IBOutlet weak var subWilayah: UILabel!
    @IBOutlet weak var bahasa: UILabel!
    @IBOutlet weak var ibuKota: UILabel!
    @IBOutlet weak var namaNegara: UILabel!
    @IBOutlet weak var lambang: UIImageView!
    
    var getNama: String!
    var getLambang : String!
    var getIbuKota : [String]!
    var getBahasa : [String:String]!
    var getSubWilayah : String!
    var getPopulasi : Int!
    var getWilayah : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lambang.kf.setImage(with: URL(string: getLambang))
        
        
        namaNegara.text = getNama
        wilayah.text = getWilayah
        subWilayah.text = getSubWilayah
        populasi.text = String(getPopulasi)
        
        
        
        if !getIbuKota.isEmpty {
            let kota = getIbuKota[0]
            ibuKota.text = kota
        } else {
            ibuKota.text = ""
        }
        
        let dictionary: [String: String]? = getBahasa
        let valuesString = dictionary!.values.joined(separator: ", ")
        bahasa.text = valuesString
        

    }
    

}
