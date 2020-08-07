//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rayen on 8/7/20.
//  Copyright © 2020 Rayen. All rights reserved.
//

import UIKit

class WeatherViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.weather.text = "30 C°"
        cell.time.text = "20.02.2020 20:02"
    
        return cell
    }
}
