//
//  ViewController.swift
//  BooksApp
//
//  Created by Данила on 05.06.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let names = ["oblomov", "dubrovskiy", "dochka", "igrok", "taras", "onegin", "besy", "dvor", "idiot", "prest", "nedorosl", "zapiski", "iliada", "drakula", "revizor", "odisseya", "ya"]

    lazy var collectionBooks: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/2.1, height: view.frame.width/2.1)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupCeollectionView()
    }


}

extension ViewController {

    func setupCeollectionView() {
        view.addSubview(collectionBooks)
        collectionBooks.frame = view.bounds
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionBooks.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        cell.loadImage(named: names[indexPath.row] + "View")
        cell.backgroundColor = .yellow
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let path = Bundle.main.url(forResource: names[indexPath.row], withExtension: "pdf") else {
            print("FAILL")
            return
        }
        let pdfController = PDFViewController(pdfUrl: path)
        self.present(pdfController, animated: true)
    }
}
