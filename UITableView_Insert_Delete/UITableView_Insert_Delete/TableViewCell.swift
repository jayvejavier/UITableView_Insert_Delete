//
//  TableViewCell.swift
//  UITableView_Insert_Delete
//
//  Created by Mospeng Research Lab Philippines on 6/15/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var tableViewController: TableViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Item"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        print("asdfas")
        return button
    }()
    
    func setupViews() {
        // Add Subviews
        addSubview(itemLabel)
        addSubview(deleteActionButton)

        // Add Comstraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-8-[v1(80)]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": itemLabel, "v1": deleteActionButton]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": itemLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": deleteActionButton]))
        // Actions
        deleteActionButton.addTarget(self, action: #selector(deleteActionButtonTapped), for: .touchUpInside)
    }
    
    @objc func deleteActionButtonTapped() {
        tableViewController?.deleteCell(cell: self)
    }
}
