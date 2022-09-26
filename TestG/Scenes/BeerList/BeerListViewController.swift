//
//  BeerListViewController.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

import UIKit

// sourcery: AutoMockable, scene="BeerList"
protocol BeerListDisplayLogic: AnyObject {
    func displayLoadBeers(_ viewModel: BeerList.LoadBeers.ViewModel)
    func displayLoadMoreBeers(_ viewModel: BeerList.LoadMoreBeers.ViewModel)
}

final class BeerListViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var interactor: BeerListBusinessLogic?
    private var router: BeerListRoutingLogic?

    private var models = [BeerTableViewCell.Configuration]()

    // MARK: Dependencies

    func setDependencies(interactor: BeerListBusinessLogic, router: BeerListRoutingLogic) {
        self.interactor = interactor
        self.router = router
    }

    // MARK: Setup

    private func setupStyling() {
        tableView.backgroundColor = UIColor.tableViewBackground
        tableView.separatorColor = UIColor.separator
    }

    private func setupOnLoad() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 250
        tableView.register(cellType: BeerTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
        setupOnLoad()

        requestDataOnLoad()
    }

    // MARK: Private

    private func requestDataOnLoad() {
        interactor?.requestLoadBeers(())
    }
}

// MARK: - BeerListDisplayLogic

extension BeerListViewController: BeerListDisplayLogic {
    func displayLoadBeers(_ viewModel: BeerList.LoadBeers.ViewModel) {
        switch viewModel.result {
        case let .success(beers):
            models = beers
            tableView.reloadData()
        case .failure(_):
            // depends on requirements handle error
            // alert, empty state, offline state and other cases
            tableView.isScrollEnabled = false
            let emptyLabel = UILabel()
            Style.Label.cellTitle(emptyLabel)
            emptyLabel.text = .localizeText(.beerListEmptyLabel)
            emptyLabel.textAlignment = .center
            tableView.backgroundView = emptyLabel
        }
    }

    func displayLoadMoreBeers(_ viewModel: BeerList.LoadMoreBeers.ViewModel) {
        switch viewModel.result {
        case let .success(beers):
            models.append(contentsOf: beers)
            tableView.reloadData()
        case .failure(_):
            break
        }
    }
}

// MARK: - UITableViewDelegate

extension BeerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension BeerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as BeerTableViewCell
        cell.update(with: models[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == models.count - 3 {
            interactor?.requestLoadMoreBeers(())
        }
    }
}
