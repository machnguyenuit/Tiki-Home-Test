//
//  ViewController.swift
//  Tiki-HotKeyword
//
//  Created by Apple on 5/16/19.
//  Copyright © 2019 nguyenmach. All rights reserved.
//

import UIKit

class ListHotKeywordVC: UIViewController {
    
    @IBOutlet weak var clvContent:UICollectionView?
    
    private let identifierCell = "ListHotKeywordCell"
    private var listHotKeyword:[KeywordModel] = []
    
    private let colors:[UIColor] = [UIColor(hex: "#16702e"),
                                    UIColor(hex: "#005a51"),
                                    UIColor(hex: "#996c00"),
                                    UIColor(hex: "#5c0a6b"),
                                    UIColor(hex: "#006d90"),
                                    UIColor(hex: "#974e06"),
                                    UIColor(hex: "#99272e"),
                                    UIColor(hex: "#89221f"),
                                    UIColor(hex: "#00345d")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getDataFromServer()
    }
    
    func setupCollectionView()  {
        clvContent?.delegate = self
        clvContent?.dataSource = self
    }
   
}

//MARK: = UICollectionViewDataSource
extension ListHotKeywordVC:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listHotKeyword.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clvContent?.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! ListHotKeywordCell
        let keyword = listHotKeyword[indexPath.row]
        let index = indexPath.row % colors.count
        let backgroundColor = colors[index]
        
        cell.configura(hotKeyword: keyword, backgroundColor: backgroundColor)
        
        return cell
    }
    
}

extension ListHotKeywordVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let keyword = listHotKeyword[indexPath.row]
        let widthLable = getWidthLable(text: keyword.keyword ?? "",
                                       font: UIFont.systemFont(ofSize: 14))
        let width:CGFloat = max(120, widthLable)
        let heigh = collectionView.frame.size.height
        
        return CGSize(width: width, height: heigh)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//MARK: = UICollectionViewDataSource
extension ListHotKeywordVC:UICollectionViewDelegate {
    
    
}

//MARK: = Support funtion
extension ListHotKeywordVC {
    func getWidthLable(text:String,font:UIFont) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width:CGFloat.greatestFiniteMagnitude,
                                                  height: 70))
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = text
        label.font = font
        label.sizeToFit()
        
        return label.frame.width
    }
}


//MARK: - API
extension ListHotKeywordVC {
    func getDataFromServer() {
        self.showLoadingIndicator()
        API.getListHotKeyword {[weak self] (result) in
            self?.dismissLoadingIndicator()
            switch result {
            case .object(let data):
                
                self?.listHotKeyword = data.keywords ?? []
                self?.clvContent?.reloadData()
                
            case .error(let error):
                print(error.message ?? "")
                break
            }
        }
    }
}
