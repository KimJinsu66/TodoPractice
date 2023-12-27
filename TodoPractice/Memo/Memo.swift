//
//  Memo.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/23.
//

import UIKit

struct Memo {
    private(set) public var id : String
    private(set) public var title : String
    private(set) public var detail : String
    
    init(id: String, title: String, detail: String) {
        self.id = id
        self.title = title
        self.detail = detail
    }
}
