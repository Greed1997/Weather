//
//  ViewController.swift
//  WeatherApi
//
//  Created by Александр on 22.11.2022.
//

import UIKit
import CoreLocation

class WeatherViewController: UITableViewController {
    
    var weather: [Weather] = []
    
    private let locationService = LocationManager.shared
    
    private let cellID = "CellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        locationService.requestPermission()
        locationService.start()
        showWeather()
        title = "Weather"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    private func showWeather() {
        Task {
            do {
                try await weather.append(NetworkManager.shared.fetchWeather())
                print(weather.count)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

}
extension WeatherViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let weather = weather[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = weather.name
        cell.contentConfiguration = content
        return cell
    }
}
