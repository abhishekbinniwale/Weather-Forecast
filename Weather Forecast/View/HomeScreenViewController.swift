//
//  HomeScreenViewController.swift
//  Weather Forecast
//
//  Created by Abhishek Binniwale on 29/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

protocol HomeScreenView : class {
    
    func updateUIWith(viewModel : WeatherInfoViewModel)
    func hideDataView(isHideen : Bool)
    
}

class HomeScreenViewController: UIViewController, HomeScreenView , UISearchBarDelegate {

    @IBOutlet weak var contentViewOutlet: UIView!
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var highLowTemperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    
    var presenter : HomeScreenPresentation?
    
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        presenter?.viewDidLoad()
    }
    
    func setUpUI(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        searchBar.delegate = self
        searchBar.placeholder = "Search City Weather"
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        self.hideDataView(isHideen: true)
    }

    
    //MARK:- UISearchBarDelegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.searchTextField.text {
            self.presenter?.searchWeatherReportFor(city: searchText)
        }
    }
    
     //MARK:- HomeScreenView methods
    func updateUIWith(viewModel : WeatherInfoViewModel){
        DispatchQueue.main.async {
            self.hideDataView(isHideen: false)
            self.cityNameLabel.text = viewModel.cityName
            self.weatherTypeLabel.text = viewModel.weatherMain
            self.temperatureLabel.text = viewModel.currentTemperature
            self.highLowTemperatureLabel.text = "\(viewModel.maximumTemperature ?? "0") / \(viewModel.minimumTemperature ?? "0")"
            self.humidityLabel.text = viewModel.humidity
            self.windLabel.text = viewModel.windSpeed
            self.visibilityLabel.text = viewModel.visibility
        }
    }
    
    func hideDataView(isHideen: Bool) {
        DispatchQueue.main.async {
            self.contentViewOutlet.isHidden = isHideen
        }
    }
    
    func showErroAlert(){
        
    }
    
}
