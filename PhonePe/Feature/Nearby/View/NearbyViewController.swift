//
//  NearbyViewController.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import UIKit

class NearbyViewController: CustomViewController<NearbyViewModel> {

    @IBOutlet weak var nearbytableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Near by Places"
        viewModel.delegate = self
        prepareController()
    
    }
    
    @IBAction func onChangeDistanceRanger(_ sender: UISlider) {
        viewModel.updateRange(with: sender.value)
    }
    
    
    private func prepareController() {
        nearbytableView.delegate = self
        nearbytableView.dataSource = self
        nearbytableView.register(UINib(nibName: "NearbyTableViewCell", bundle: nil), forCellReuseIdentifier: "NearbyTableViewCell")
        self.searchBar.delegate = self
    }
}
extension NearbyViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalPlaceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let nearbyCell = tableView.dequeueReusableCell(withIdentifier: "NearbyTableViewCell", for: indexPath) as? NearbyTableViewCell else{
            return UITableViewCell()
        }
        
        let venue = viewModel.venues[indexPath.row]
        nearbyCell.configureSelf(name: venue.name ?? "Name", address: venue.address ?? "Address", country: venue.city ?? "City")
        return nearbyCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height )  {
            viewModel.loadMoreData()
        }
    }
}


extension NearbyViewController: NearByViewmodelDelegate {
    func reload() {
        DispatchQueue.main.async {
            self.nearbytableView.reloadData()
        }
        
    }
}

extension NearbyViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchedText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        let filterCity = viewModel.venues.filter { venue in
            guard let city = venue.city else { return false }
            return city.localizedCaseInsensitiveContains(searchedText)
        }
        print(filterCity)
    }
}
