//
//  AbstractTableDataSource.swift
//  safesensor
//
//  Created by Anton Skorodumov on 06.07.17.
//  Copyright © 2017 E-Lite-Telecom. All rights reserved.
//

import Foundation
import UIKit

class AnyTableDataSource: NSObject {
    
    private var section: Int = 0
    
    internal var builders: [AbstractSectionDataBuilder]!
    internal var scrollListener: ((Float, Float) -> Void)?
    
    override init() {
        super.init()
        builders = [AbstractSectionDataBuilder]()
    }
    
    public func registerSection<Data, Cell: UITableViewCell>(for cell: Cell.Type,
                                for dataType: Data.Type,
                                with data: [Data],
                                factory: @escaping (Data, Cell, Int, Int) -> Cell,
                                selectAction: ((Data) -> Void)?) {
        let builder = SectionDataBuilder<Data, Cell>(section: section, data: data, factory: factory, selectAction: selectAction, header: nil)
        builders.append(builder)
        section += 1
    }
    
    public func registerSection<Data, Cell: UITableViewCell>(for cell: Cell.Type,
                                with data: Data,
                                factory: @escaping (Data, Cell, Int, Int) -> Cell,
                                selectAction: ((Data) -> Void)?) {
        let builder = SectionDataBuilder<Data, Cell>(section: section, data: [data], factory: factory, selectAction: selectAction, header: nil)
        builders.append(builder)
        section += 1
    }
    
    public func registerSection<Data, Cell: UITableViewCell>(for cell: Cell.Type,
                                with data: [Data],
                                factory: @escaping (Data, Cell, Int, Int) -> Cell,
                                selectAction: ((Data) -> Void)?,
                                header: String?) {
        let builder = SectionDataBuilder<Data, Cell>(section: section, data: data, factory: factory, selectAction: selectAction, header: header)
        builders.append(builder)
        section += 1
    }
    
    public func register(scrollListener scroll: @escaping (Float, Float) -> Void ) {
        scrollListener = scroll
    }
    
    public func clear() {
        builders.forEach { (builder) in
            builder.clearData()
        }
        builders.removeAll()
        section = 0
    }
}

extension AnyTableDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return builders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let builderData: AbstractSectionDataBuilder = builders[section]
        return builderData.numberOfRowForSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let builderData: AbstractSectionDataBuilder = builders[indexPath.section]
        return builderData.cellForRowFromTable(tableView: tableView, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let builderData: AbstractSectionDataBuilder = builders[section]
        return builderData.titleForSection(index: section)
    }
}

extension AnyTableDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let builderData: AbstractSectionDataBuilder = builders[indexPath.section]
        builderData.selectRowForIndex(index: indexPath.row)
    }
}

extension AnyTableDataSource: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentSizeHeight: Float = Float(scrollView.contentSize.height)
        let contentOffsetY: Float = Float(scrollView.contentOffset.y)
        let maximumOffset: Float = contentSizeHeight - Float(scrollView.frame.size.height)
        scrollListener?(maximumOffset, contentOffsetY)
    }
}
