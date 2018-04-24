//
//  ShopListViewController.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

fileprivate extension Selector {
    static let addAction = #selector(ShopListViewController.addButtonTap)
    static let deleteAction = #selector(ShopListViewController.deleteButtonTap)
}

final class ShopListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let viewModel: ShopListViewModelProtocol
    private var tableView: UITableView!
    private let dateFormatter = DateFormatter()
    
    init(viewModel: ShopListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        configureTableView()
        viewModel.fetchData()
        observeFetchedData()
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.register(SubtitleCell.self)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        tableView.tableFooterView = UIView()
    }
    
    private func configureButtons() {
        let rightBarButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: Selector.addAction)
        navigationItem.rightBarButtonItem = rightBarButton
        
        let leftBarButton = UIBarButtonItem(title: "Delete", style: .done, target: self, action: Selector.deleteAction)
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    private func observeFetchedData() {
        viewModel.listPositions.asObservable().bind(to: tableView.rx.items(
            cellIdentifier: SubtitleCell.reuseIdentifier,
            cellType: SubtitleCell.self)) { (index, element, cell) in
                let title = self.dateFormatter.string(from: element.creationDate)
                let elementsList = element.items.map {$0.productName}.joined(separator: ", ")
                cell.setup(title: title, subtitle: elementsList)
        }.disposed(by: disposeBag)
    }
}

extension ShopListViewController {
    @objc fileprivate func addButtonTap() {
        viewModel.addAction.onNext(())
    }
    
    @objc fileprivate func deleteButtonTap() {
        viewModel.deleteAction.onNext(())
    }
}
