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
    var homeVM = HomeViewModel()
    var model: Books?
    
    // MARK: Outlets
    @IBOutlet weak var imageLineBorrowed: UIImageView!
    @IBOutlet weak var collectionViewFavoriteBooks: UICollectionView!
    @IBOutlet weak var collectionViewFavoriteAuthors: UICollectionView!
    @IBOutlet weak var collectionViewLibrary: UICollectionView!
    @IBOutlet weak var tableViewAllBooks: UITableView!
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookInfo()
        setupUI()
        setDelegateAndDataSource()
        registerCells()
        tableViewAllBooks.separatorStyle = .none
    }
    
    // MARK: Methods
    private func setupUI() {
        imageLineBorrowed.isHidden = true
    }
    
    private func getBookInfo() {
        homeVM.getBooksInfo { books in
            self.model = books
        }
    }
    
    private func setDelegateAndDataSource() {
        collectionViewFavoriteBooks.delegate = self
        collectionViewFavoriteBooks.dataSource = self
        collectionViewFavoriteAuthors.delegate = self
        collectionViewFavoriteAuthors.dataSource = self
        collectionViewLibrary.delegate = self
        collectionViewLibrary.dataSource = self
        tableViewAllBooks.delegate = self
        tableViewAllBooks.dataSource = self
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    private func registerCells() {
        collectionViewFavoriteBooks.register(UINib(nibName: "FavoriteBooksCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionViewFavoriteAuthors.register(UINib(nibName: "FavoriteAuthorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cells")
        collectionViewLibrary.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        tableViewAllBooks.register(UINib(nibName: "AllBooksTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    // MARK: Actions
    @IBAction func handlerButtonBorrowed(_ sender: Any) {
        showAlert(title: "Ops...", message: "Sessão emprestados não encontrada")
    }
    @IBAction func buttonSeeAllBooks(_ sender: Any) {
        showAlert(title: "Ops...", message: "Parece que não tem nada por aqui")
    }
    
    @IBAction func buttonSeeAllAuthors(_ sender: Any) {
        showAlert(title: "Ops...", message: "Parece que não tem nada por aqui")
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewFavoriteAuthors {
            return model?.data.favoriteAuthors.count ?? 1
        } else if collectionView == collectionViewLibrary {
            return libraryCollectionCellNames.count
        }
            return model?.data.favoriteBooks.count ?? 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewFavoriteBooks {
            let detail = DetailBooksViewController()
            detail.modalPresentationStyle = .fullScreen
            detail.modalTransitionStyle = .coverVertical
            present(detail, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionViewFavoriteBooks.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FavoriteBooksCollectionViewCell {
            
            if collectionView == collectionViewFavoriteAuthors {
                let cellAuthors = collectionViewFavoriteAuthors.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as! FavoriteAuthorsCollectionViewCell
                cellAuthors.labelAuthor.text = model?.data.favoriteAuthors[indexPath.row].name
                cellAuthors.labelNumberOfBooks.text = "\(model?.data.favoriteAuthors[indexPath.row].booksCount ?? 1) livros"
                cellAuthors.imageAuthor.sd_setImage(with: URL(string: model?.data.favoriteAuthors[indexPath.row].picture ?? ""))
                return cellAuthors
                
            } else if collectionView == collectionViewLibrary {
                let cellLibrary = collectionViewLibrary.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
                cellLibrary.buttonCategory.setTitle(libraryCollectionCellNames[indexPath.row], for: .normal)
                if indexPath.row == 0 {
                    cellLibrary.buttonCategory.backgroundColor = .tabBarSelectedIconColor
                    cellLibrary.buttonCategory.setTitleColor(.white, for: .normal)
                }
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
        if let cell = tableViewAllBooks.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AllBooksTableViewCell {
            cell.imageBook.sd_setImage(with: URL(string: model?.data.allBooks[indexPath.row].cover ?? ""))
            cell.labelAuthor.text = model?.data.allBooks[indexPath.row].author
            cell.labelBookName.text = model?.data.allBooks[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
}
