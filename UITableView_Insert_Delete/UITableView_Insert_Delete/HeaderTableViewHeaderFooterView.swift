//
//  HeaderTableViewHeaderFooterView.swift
//  UITableView_Insert_Delete
//
//  Created by Mospeng Research Lab Philippines on 6/15/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class HeaderTableViewHeaderFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Section Header"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupHeaderViews() {
        addSubview(sectionHeaderLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": sectionHeaderLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": sectionHeaderLabel]))
    }

}
