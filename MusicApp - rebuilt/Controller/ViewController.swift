//
//  ViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 03/06/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var song = [songsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("View loaded")
        
       // let navigationController = UINavigationController()
      //  navigationController.navigationBar.prefersLargeTitles = true
      //  UINavigationBar.appearance().largeTitleTextAttributes = [
      //      NSAttributedString.Key.foregroundColor: UIColor.white
      //  ]
      //  UINavigationBarAppearance().backgroundColor = UIColor.white
        //let apperance = UINavigationBarAppearance()
       // apperance.configureWithTransparentBackground()
        //apperance.backgroundColor = UIColor.black
        //self.navigationItem.title = "Music"
        
       // appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        //apperance.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        //appearance.titleTextAttributes = selectedCategory!.name
       // navigationItem.standardAppearance = appearance
        //navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Music"
        navigationItem.titleView?.tintColor = .systemPink
        
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 100
        table.backgroundColor = UIColor.black
        
        view.addSubview(table)
        //view.addSubview()

        configureSngs()
    }
    

    func configureSngs(){
        song.append(songsList(songName: "Wildest Dream", albumNAme: "Taylor Swift", arstistName: "TAYLOR SWIFT", imageName: "Cover1", audioName: "Taylor-Swift-Wildest-dreams"))
        song.append(songsList(songName: "Perfect", albumNAme: "ED SHEERAN", arstistName: "TEd Sheeran", imageName: "Cover2", audioName: "Ed_Sheeran_-_Perfect_(thinknews.com.ng)"))
        song.append(songsList(songName: "Closer", albumNAme: "ChainSmokers", arstistName: "CHAIN SMOKERS", imageName: "Cover3", audioName: "Closer - The Chainsmokers"))
        song.append(songsList(songName: "Positions", albumNAme: "Ariana Grande", arstistName: "ARIANA GRANDE", imageName: "Cover4", audioName: "Ariana_Grande_-_Position(Correctvibe.com)"))
        song.append(songsList(songName: "Levitating", albumNAme: "Dua Lipa", arstistName: "DUA LIPA", imageName: "Cover5", audioName: "Dua Lipa - Levitating (Official)"))
        song.append(songsList(songName: "Attention", albumNAme: "Charlie Puth", arstistName: "CHARLIE PUTH", imageName: "Cover6", audioName: "Charlie_Puth_Attention_(thinkNews.com.ng)"))
        song.append(songsList(songName: "Fake Love", albumNAme: "BTS", arstistName: "BTS", imageName: "Cover7", audioName: "BTS - Fake Love_128-(MastiMusic.Com)"))
        song.append(songsList(songName: "STAY", albumNAme: "Justin Bieber", arstistName: "JUSTIN BIEBER", imageName: "Cover8", audioName: "Stay_192(PaglaSongs)"))
        //Cool-for-the-Summer_320(PaglaSongs)
        song.append(songsList(songName: "Cool for the Summer", albumNAme: "Demi Lovato", arstistName: "DEMI LOVATO", imageName: "Cover9", audioName: "Cool-for-the-Summer_320(PaglaSongs)"))
    }
    
  //  MARK: - Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("View loaded count")
         return  song.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("View loaded cell")
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let songs = song[indexPath.row]
        
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = songs.songName
        cell.detailTextLabel?.text = songs.arstistName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: songs.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        cell.detailTextLabel?.textColor = UIColor.white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else{
            fatalError("ERROR ON SELECTION")
        }
        vc.modalTransitionStyle = .flipHorizontal
        
        vc.songz = song
        vc.position =  position
        
        present(vc, animated: true)
    }
    

    @IBAction func likeSongPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "likeSongs", sender: self)
        
        
    }
    
}

struct Songs{
    
    let songName : String
    var albumNAme : String
    var arstistName : String
    var imageName : String
    var audioName : String
    
}

