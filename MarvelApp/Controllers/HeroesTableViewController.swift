//
//  HeroesTableViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 06/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {

    
    var name: String = " "
    var heroes: [Hero] = []
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func loadHeroes() {
        loadingHeroes = true
        
        MarvelApi.loadHeroes(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.label.text = "Não foram encontrados heróis com o nome \(self.name)"
                    self.tableView.reloadData()
                }

            }
        
        }
    
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }
    
}
