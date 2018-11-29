//
//  FavTableViewController.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/7/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import Foundation

import UIKit

class MovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var movieArray: [Movie]?
    var cachedImages: [Int:UIImage] = [:]
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ collectionView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (movieArray?.count)!
    }
    
    func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = collectionView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        let movie = movieArray?[indexPath.row]
        cell.movieName.text = movie?.name
        if let image = cachedImages[indexPath.row] {
            cell.movieImage.image = image // may need to change this!
        } else {
            cell.movieImage.image = nil
            let url = URL(string: (movie?.imageUrl)!)!
            let session = URLSession(configuration: .default)
            let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                if let e = error {
                    print("Error downloading picture: \(e)")
                } else {
                    if let _ = response as? HTTPURLResponse {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.cachedImages[indexPath.row] = image
                                cell.movieImage.image = image // UIImage(data: imageData)
                            }
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    } else {
                        print("Couldn't get response code")
                    }
                }
            }
            downloadPicTask.resume()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "tableToInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MovieInfoViewController {
            dest.movie = movieArray?[(selectedIndexPath?.row)!]
            if let image = cachedImages[(selectedIndexPath?.row)!] {
                dest.image = image
            }
        }
    }
    
    
}
