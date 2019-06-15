//
//  SourceViewController.swift
//  ProxymanHub
//
//  Created by Nghia Tran on 6/15/19.
//  Copyright © 2019 Nghia Tran. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!

    private let factory = SourceFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
    }

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SourceViewController: NSTableViewDelegate, NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return factory.sources.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("SourceTableCellView"), owner: self)
            as? SourceTableCellView else { return nil }

        let source = factory.sources[row]
        view.textField?.stringValue = source.shortDescription

        return view
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let selectedIndex = tableView.selectedRowIndexes.first else { return }
        let source = factory.sources[selectedIndex]
        NotificationCenter.default.post(name: NSNotification.Name("SourceDidSelectNotification"), object: source)
    }
}
