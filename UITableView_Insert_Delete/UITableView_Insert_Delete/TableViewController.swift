//
//  TableViewController.swift
//  UITableView_Insert_Delete
//
//  Created by Mospeng Research Lab Philippines on 6/15/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var itemdDataSource = ["Item 1", "Item 2", "Item 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My TableView"
        // Set target: self, if you sppecify action
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Insert", style: .plain, target: self, action: #selector(insertBarButtonItemTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batch Insert", style: .plain, target: self, action:  #selector(batchInsertBarButtonItemTapped))
        
        tableView.backgroundColor = .white
        tableView.register(HeaderTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.sectionHeaderHeight = 50
        tableView.rowHeight = 45
        tableView.tableFooterView = UIView()
    } 
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TableViewCell
        cell.itemLabel.text = itemdDataSource[indexPath.row]
        cell.tableViewController = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemdDataSource.count
    }
    
   
    
    func deleteCell(cell: UITableViewCell) {
        if let deletionIndexPath = tableView.indexPath(for: cell) {
            itemdDataSource.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }
    }
    
    @objc func insertBarButtonItemTapped() {
        itemdDataSource.append("Item \(itemdDataSource.count + 1)")

        let insertionIndexPath = IndexPath(row: itemdDataSource.count - 1, section: 0)
        tableView.insertRows(at: [insertionIndexPath], with: .automatic)
    }
    
    @objc func batchInsertBarButtonItemTapped(){
        var indexPaths = [IndexPath]()
        for i in itemdDataSource.count...itemdDataSource.count + 5 {
            itemdDataSource.append("Item \(i + 1)")
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        var bottomHalfIndexPaths = [IndexPath]()
        for _ in 0...itemdDataSource.count / 2 - 1 {
            if !indexPaths.isEmpty {
                bottomHalfIndexPaths.append(indexPaths.removeLast())
            }
        }

        //Use beginUpdates and endUpdates to update table simultaneously
        tableView.beginUpdates()

        tableView.insertRows(at: indexPaths, with: .right)
        tableView.insertRows(at: bottomHalfIndexPaths, with: .left)

        tableView.endUpdates()
    }

}

