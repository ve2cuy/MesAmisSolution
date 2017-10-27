//
//  ViewController.swift
//  MesAmis
//
//  Created by Alain on 17-10-27.
//  Copyright © 2017 Alain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
  
    
  var mesAmis:Array<Dictionary<String,String>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 - Charger les données
        let pathFichierPlist = Bundle.main.path(forResource: "liste des amis", ofType: "plist")!
        mesAmis = NSArray(contentsOfFile: pathFichierPlist) as! Array
        print(mesAmis)
    } // viewDidLoad

  
    // 2 - programmer UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mesAmis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let indice = indexPath.row
        
        print("cellule no: \(indice)")
        let nom = mesAmis[indice]["nom"] ?? "N/D"
        let dette = mesAmis[indice]["dette"] ?? "N/D"
        let image = mesAmis[indice]["photo"] ?? "nd.jpg"
        
        let nomModele =  Float(dette)! <= 10 ? "vert":"rouge"
        
        let cellule = collectionView.dequeueReusableCell(withReuseIdentifier: nomModele, for: indexPath) as! CelluleAmi
        
        
       
        
        cellule.amiNom?.text = nom
        cellule.amiDette?.text = dette
        cellule.amiImage?.image = UIImage(named:image)
        return cellule
    }

}

