//
//  UserDefaults.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/26/22.
//

//
import SwiftUI
import FirebaseFirestore
import Combine

class Favorites: ObservableObject {
    private var videos: Set<String>

    
    @Published var task: Set<Int> {
         didSet {
             save()
         }
     }
    private let saveKey = "Favorites"
    
    init() {
        // load our saved data
        self.task = Set((UserDefaults.standard.array(forKey: saveKey) as? [Int]) ?? [])
//        let userDefaults = UserDefaults.standard
//        userDefaults.object(forKey: saveKey)
        self.videos = []
    }
    func update()   {
        let ref = Firestore.firestore()
        let user = ref.collection("favorites").document("Favorite")
        
        
        user.collection("favorites").whereField("Favorite", isEqualTo: "Favorite")
                   .addSnapshotListener { querySnapshot, error in
                       guard let snapshot = querySnapshot else {
                           print("Error fetching documents: \(error!)")
                           return
                       }
                       snapshot.documentChanges.forEach { diff in
                           if (diff.type == .added) {
                               print("New city: \(diff.document.data())")
                           }
                       }

                       if !snapshot.metadata.isFromCache {
                           print("Synced with server state.")
                       }
                   }
        
    }
    func new() {
        let reference = Firestore.firestore()
        reference.collection("favorites").document("Favorite").setData(["Favorite" : "Name of post"])
        
//        var ref: DocumentReference? = nil
//        ref = reference.collection("users").addDocument(data: [
//            "favorite": "true"
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
        
        
    }
    func contains(_ video: Video) -> Bool {

//        update()
        return true
    }
    func add(_ video: Video) {
        objectWillChange.send()
//        videos.insert(video.title)
        new()
    }
    func remove(_ video: Video) {
        objectWillChange.send()
        videos.remove(video.title)
        save()
//        update()
    }
    func save() {
        // write out our data
//        UserDefaults.standard.setValue(Array(task), forKey: saveKey)
//        UserDefaults.standard.set(1, forKey: saveKey)  //Intege
        let ref = Firestore.firestore()
        let user = ref.collection("favorites")
        
        user.getDocuments(){
            (querySnapshot, error) in
            if let error = error{
                print(error)
                
            }
            else{
//                for document in querySnapshot!.documents{
                    ref.collection("favorites").document("Favorite").delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
//                    print(document.data()["email"])
                }
            }
        }
        
        //UserDefaults.standard.set(Array(videos), forKey: saveKey)\
        //print("Favorited")
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(true, forKey: saveKey)
        
    }
//}
//class Favorites: ObservableObject {
//    private var videos: Set<String>
//    let defaults = UserDefaults.standard
//
//    init() {
//        let decoder = JSONDecoder()
//        if let data = defaults.data(forKey: "Favorites") {
//            let videoData = try? decoder.decode(Set<String>.self, from: data)
//            self.videos = videoData ?? []
//        } else {
//            self.videos = []
//        }
//    }
//    func add(_ video: Video) {
//        objectWillChange.send()
//        videos.insert(video.title)
//        save()
//    }
//
//    func remove(_ video: Video) {
//        objectWillChange.send()
//        videos.remove(video.title)
//        save()
//    }
//
//    func save() {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(videos) {
//            defaults.set(encoded, forKey: "Favorites")
//        }
//    }
//}
