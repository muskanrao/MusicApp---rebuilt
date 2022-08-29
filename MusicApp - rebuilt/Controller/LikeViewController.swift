//
//  LikeViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 19/06/22.
//
/*
import Foundation
import UIKit
//import FirebaseFirestore
//import FirebaseAuth

class LikeViewontroller: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    /*
    @IBOutlet weak var table: UITableView!
    var likedSongList = [songsList]()
    var db = Firestore.firestore()
    var  songlistName :String = ""
    var album : String = ""
    var artist : String = ""
    var  imageurl : String = ""
    var audioUrl : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        print("like view loaded")
        view.backgroundColor = UIColor.black
        self.navigationItem.title = "Favourites"
        table.dataSource = self
        table.delegate = self
       
        
       // table.rowHeight = 100
        table.backgroundColor = UIColor.black
       
        loadSongs()
        likedSongList.append(songsList(songName: songlistName, albumNAme: album, arstistName: artist, imageName: imageurl, audioName: audioUrl))
       
        
    }
    
   // MARK: -Data Source
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Like view count ")
        loadSongs()
        print(likedSongList.count)
        return likedSongList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("songs.songName")
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let songs = likedSongList[indexPath.row]
        print("called here \(songs.songName)")
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
        
        vc.songz = likedSongList
        vc.position =  position
        
        present(vc, animated: true)
        
    }
    
    
    func loadSongs(){
        
        db.collection("user").getDocuments { (querySnapshot , error) in
            if error != nil{
                print("Error while loading saved data.")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        print(Auth.auth().currentUser?.email! )
                        if data["sender"] as! String  == Auth.auth().currentUser?.email {
                            self.songlistName = data["song"] as! String
                            self.album = data["album"] as! String
                            self.artist = data["artist"] as! String
                            self.imageurl = data["image"] as! String
                            self.audioUrl = data["audio"] as! String
                            
                            print(self.songlistName)
                            print(self.album)
                            print(self.artist)
                            print(self.imageurl)
                            print(self.audioUrl)
                            
                           // self.item = booking
                            //print(booking)
                            //self.performSegue(withIdentifier: "ToViewBook", sender: self)
                          
                          
                        } //let booking = data["bookedSeat"] as? String{
                            
                            //self.performSegue(withIdentifier: "ToViewBook", sender: self)
                            // print(sender)
                            
                            //self.item = booking
                        }
                    }
                }
            }
        }
    */
 }
*/
