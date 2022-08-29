//
//  PlayerViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 03/06/22.
//

import AVFoundation
import UIKit
//import FirebaseFirestore
//import FirebaseAuth

class PlayerViewController : UIViewController {
   
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var ArstistNameLabel: UILabel!
    @IBOutlet weak var AlbumNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var musicNote: UIImageView!
    
   // let likeView = LikeViewontroller()
    var player: AVAudioPlayer?
    var imageUrl : String = ""
    var audioUrl : String = ""
  //  var db = Firestore.firestore()
    
    public var position: Int = 0
    public var songz: [songsList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let largeConfig = UIImage.SymbolConfiguration(pointSize: 60, weight: .bold, scale: .large)
               
         let largeBoldDoc1 = UIImage(systemName: "pause.circle.fill", withConfiguration: largeConfig)
         playPauseButton.setImage(largeBoldDoc1, for: .normal)
        
        let largeBoldDoc2 = UIImage(systemName: "backward.circle.fill", withConfiguration: largeConfig)
        backButton.setImage(largeBoldDoc2, for: .normal)
        
        let largeBoldDoc3 = UIImage(systemName: "forward.circle.fill", withConfiguration: largeConfig)
        nextButton.setImage(largeBoldDoc3, for: .normal)
        
        
        configure()
    
    }
    
    
    func configure(){
        
        //player
        let sng = songz[position]
        
        let urlString = Bundle.main.url(forResource: sng.audioName, withExtension: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else{
                fatalError()
            }
            
            player = try! AVAudioPlayer(contentsOf: urlString)
            
            guard let player = player else{
                fatalError()
            }
            
            player.volume = 0.5
            player.play()
            
        }catch{
            print(error)
        }
        audioUrl = sng.audioName
        imageUrl = sng.imageName
        albumImageView.image = UIImage(named: sng.imageName)
       
        songNameLabel.text = sng.songName
        AlbumNameLabel.text = sng.albumNAme
        ArstistNameLabel.text = sng.arstistName
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: view.frame.width-20, height: view.frame.width-20)

        view.addSubview(albumImageView)
        view.addSubview(songNameLabel)
        view.addSubview(AlbumNameLabel)
        view.addSubview(ArstistNameLabel)
        view.addSubview(playPauseButton)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        view.addSubview(musicNote)
        view.addSubview(likeButton)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    

    @IBAction func didTapBackButton(_ sender: UIButton) {
        
        if position > 0{
            position = position - 1
            player?.stop()
            for subview in view.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @IBAction func didTapPlayPauseButton(_ sender: UIButton) {
        
        if ((player?.isPlaying) == true){
            player?.pause()
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 60, weight: .bold, scale: .large)
                   
             let largeBoldDoc1 = UIImage(systemName: "play.circle.fill", withConfiguration: largeConfig)
             playPauseButton.setImage(largeBoldDoc1, for: .normal)
            
            UIView.animate(withDuration: 0.2, animations: { self.albumImageView.frame = CGRect(x: 30, y: 30, width: self.view.frame.width-60, height: self.view.frame.width-60)  } )
        
        }else{
            player?.play()
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 60, weight: .bold, scale: .large)
                   
             let largeBoldDoc1 = UIImage(systemName: "pause.circle.fill", withConfiguration: largeConfig)
             playPauseButton.setImage(largeBoldDoc1, for: .normal)

            UIView.animate(withDuration: 0.2, animations: { self.albumImageView.frame = CGRect(x: 10, y: 10, width: self.view.frame.width-20, height: self.view.frame.width-20)  } )
            
        }
        
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        
        if position < songz.count - 1 {
            position = position + 1
            player?.stop()
            for subview in view.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        print("Added to liked song.")
  //      self.addData()
  
    }
    /*
   func addData(){
       
       
       let snglist = songz[position]
       let selectedSong = snglist.songName
       let albumName  =  snglist.albumNAme
       let artistName = snglist.arstistName
       let songImage = imageUrl
       let audioName = audioUrl
      // self.likeView.likedSongList.append(songsList(songName: selectedSong, albumNAme: albumName, arstistName: artistName, imageName: songImage, audioName: audioName))
       self.db.collection("user").addDocument(data: ["sender":Auth.auth().currentUser?.email,"song":selectedSong, "album":albumName, "artist":artistName, "image":songImage, "audio":audioName]){(error) in
            if error != nil{
                print("Error while adding data \(error)")
            }else{
                
                print("succesfully added")
               // self.performSegue(withIdentifier: "likeSongs", sender: self)
            }
        }
        */
       //likeView.likedSongList.append(songsList(songName: selectedSong, albumNAme: albumName, arstistName: artistName, imageName: songImage, audioName: audioName))    
        
   // }
//}
//let senderData = self.userImage.image!.pngData()
//let senderName =  self.usrenameText.text
// let senderEmail =   Auth.auth().currentUser?.email
/*
self.db.collection("user").addDocument(data: ["senderProfile":senderData,"senderEmail":senderEmail,"senderName":senderName]){(error) in
    if  error != nil{
        print("The error while storing data to dataBase \(error)")
    }else{
        print("Succefully saved!")
    }
 
 func loadBooking(){
     var booking = ""
     db.collection("user").getDocuments { (querySnapshot , error) in
         if error != nil{
             print("Error while loading saved data.")
         }else{
             if let snapshotDocuments = querySnapshot?.documents{
                 for doc in snapshotDocuments{
                     let data = doc.data()
                     print(Auth.auth().currentUser?.email)
                     if data["sender"] as! String  == Auth.auth().currentUser?.email {
                         booking = data["bookedSeat"] as! String
                         self.item = booking
                         print(booking)
                         self.performSegue(withIdentifier: "ToViewBook", sender: self)
                         break
                       
                     } //let booking = data["bookedSeat"] as? String{
                         
                         //self.performSegue(withIdentifier: "ToViewBook", sender: self)
                         // print(sender)
                         
                         //self.item = booking
                     }
                 }
             }
         }
     }*/
}
