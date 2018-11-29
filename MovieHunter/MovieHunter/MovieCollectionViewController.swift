//
//  MovieCollectionViewController.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/26/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import Foundation
import UIKit

class MovieCollectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var movieArray: [Movie] = []
    var filteredArray: [Movie] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieGenerator.categoryDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        let name = MovieGenerator.categoryDict[indexPath.row]
        cell.imageView.image = UIImage(named: name!)
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filteredArray = filteredMovie(ofType: indexPath.row)
        performSegue(withIdentifier: "collectionToTable", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MovieTableViewController {
            dest.movieArray = filteredArray
        }
    }
    
    // Utility function to iterate through pokemon array for a single category
    func filteredMovie(ofType type: Int) -> [Movie] {
        var filtered: [Movie] = []
        for movie in movieArray {
            if (movie.genre.contains(MovieGenerator.categoryDict[type]!)) {
                filtered.append(movie)
            }
        }
        return filtered
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieArray = MovieGenerator.getMovieArray()
        print(movieArray.count)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
