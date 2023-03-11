//
//  ViewController.swift
//  sesi2-negara
//
//  Created by Dony Prastiya on 04/03/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let search = UISearchController()
    
    var flags : [FlagResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.searchController = search
        search.searchBar.placeholder = "Cari Negara"
        search.searchBar.delegate = self
        
        get()
        setup()
    }
    
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    func get(){
        APIService.shared.getAllCountries() { (data) in
            print(data)
            self.flags = data
            self.tableView.reloadData()
        }
        
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath) as! CountriesViewCell
        
        let value = flags[indexPath.row]
        cell.name.text = value.common
        cell.flag.kf.setImage(with: URL(string: value.flagsPng))
        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let flag = flags[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NegaraDetail") as! NegaraDetailViewController
        
        viewController.getNama = flag.common
        viewController.getIbuKota = flag.capital
        viewController.getLambang = flag.coatOfArmsPng
        viewController.getSubWilayah = flag.subregion
        viewController.getWilayah = flag.region
        viewController.getBahasa = flag.languages
        viewController.getPopulasi = flag.population
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

