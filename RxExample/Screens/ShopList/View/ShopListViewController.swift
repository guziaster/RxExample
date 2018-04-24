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

final class ShopListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let viewModel: ShopListViewModelProtocol
    private var tableView: UITableView!
    private let dateFormatter = DateFormatter()
    private var dataSource: RxTableViewSectionedAnimatedDataSource<ListPositionSection>!
    
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
        
        dataSource = RxTableViewSectionedAnimatedDataSource<ListPositionSection>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: SubtitleCell.reuseIdentifier, for: indexPath) as! SubtitleCell
            let elementsList = item.items.map {$0.productName}.joined(separator: ", ")
            cell.setup(title: String(item.id), subtitle: elementsList)
            return cell
        })
    }
    
    private func configureButtons() {
        let rightBarButton = UIBarButtonItem(title: "Add", style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
        
        let leftBarButton = UIBarButtonItem(title: "Delete", style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftBarButton
        
        _ = rightBarButton.rx.tap.bind(to: viewModel.addAction).disposed(by: disposeBag)
        _ = leftBarButton.rx.tap.bind(to: viewModel.deleteAction).disposed(by: disposeBag)
    }
    
    private func observeFetchedData() {
        viewModel.listPositions.asObservable()
            .map { (items) -> [ListPositionSection] in
                let listPosition = ListPositionSection(header: "", items: items)
                return [listPosition]
            }.bind(to:
                tableView.rx.items(dataSource: dataSource)
            ).disposed(by: disposeBag)
    }
    
}
