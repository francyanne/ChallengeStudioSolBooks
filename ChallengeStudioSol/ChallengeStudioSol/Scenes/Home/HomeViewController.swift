//
//  HomeViewController.swift
//  ChallengeStudioSol
//
//  Created by Fran Martins on 01/11/22.
//

import UIKit
import SDWebImage

final class HomeViewController: UIViewController {
    // MARK: Properties
    var libraryCollectionCellNames = ["Technology", "Travel", "Horror", "Adventure", "Comedy", "Romance"]
    let detail = DetailBookViewController()
    var homeVM = HomeViewModel()
    var model: Books?
    
    // MARK: Outlets
    @IBOutlet weak var imageBottomMyBooks: UIImageView!
    @IBOutlet weak var imageBottomBorrowed: UIImageView!
    @IBOutlet weak var collectionViewBooks: UICollectionView!
    @IBOutlet weak var collectionViewAuthors: UICollectionView!
    @IBOutlet weak var collectionViewLibrary: UICollectionView!
    @IBOutlet weak var tableViewLibrary: UITableView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookInfo()
        setupUI()
        setDelegateAndDataSource()
        registerCells()
        tableViewLibrary.separatorStyle = .none
    }
    
    // MARK: Methods
    private func setupUI() {
        imageBottomBorrowed.isHidden = true
    }
    
    private func getBookInfo() {
        homeVM.getBooksInfo { books in
            self.model = books
        }
    }
    
    private func setDelegateAndDataSource() {
        collectionViewBooks.delegate = self
        collectionViewBooks.dataSource = self
        collectionViewAuthors.delegate = self
        collectionViewAuthors.dataSource = self
        collectionViewLibrary.delegate = self
        collectionViewLibrary.dataSource = self
        tableViewLibrary.delegate = self
        tableViewLibrary.dataSource = self
    }
    
    private func registerCells() {
        collectionViewBooks.register(UINib(nibName: "FavoriteBooksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionViewAuthors.register(UINib(nibName: "FavoriteAuthorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cells")
        collectionViewLibrary.register(UINib(nibName: "LibraryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        tableViewLibrary.register(UINib(nibName: "LibraryTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func hidePurpleLineTop() {
        
    }
    // MARK: Actions
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewAuthors {
            return model?.data.favoriteAuthors.count ?? 1
        } else if collectionView == collectionViewLibrary {
            return libraryCollectionCellNames.count
        }
            return model?.data.favoriteBooks.count ?? 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewBooks {
            detail.modalPresentationStyle = .fullScreen
            detail.modalTransitionStyle = .coverVertical
            present(detail, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionViewBooks.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FavoriteBooksCollectionViewCell {
            
            if collectionView == collectionViewAuthors {
                let cellAuthors = collectionViewAuthors.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as! FavoriteAuthorsCollectionViewCell
                cellAuthors.labelAuthor.text = model?.data.favoriteAuthors[indexPath.row].name
                cellAuthors.labelNumberOfBooks.text = "\(model?.data.favoriteAuthors[indexPath.row].booksCount ?? 1) livros"
                cellAuthors.imageAuthor.sd_setImage(with: URL(string: model?.data.favoriteAuthors[indexPath.row].picture ?? ""))
                return cellAuthors
                
            } else if collectionView == collectionViewLibrary {
                let cellLibrary = collectionViewLibrary.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LibraryCollectionViewCell
                cellLibrary.buttonCell.setTitle(libraryCollectionCellNames[indexPath.row], for: .normal)
                return cellLibrary
            }
            
            cell.labelBookName.text = model?.data.favoriteBooks[indexPath.row].name
            cell.labelAuthor.text = model?.data.favoriteBooks[indexPath.row].author
            cell.imageBook.sd_setImage(with: URL(string: model?.data.favoriteBooks[indexPath.row].cover ?? ""))
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.data.allBooks.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewLibrary.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LibraryTableViewCell {
            cell.imageBook.sd_setImage(with: URL(string: model?.data.allBooks[indexPath.row].cover ?? ""))
            cell.labelAuthor.text = model?.data.allBooks[indexPath.row].author
            cell.labelBookName.text = model?.data.allBooks[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
}