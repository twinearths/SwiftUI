//
//  SwiftUIListView.swift
//  SwiftUIApp
//
//  Created by DAO QUAN on 2022/01/27.
//

import SwiftUI

struct SwiftUIListView: View {
    let datas =  ["Section 1":["Item 1", "Item 2"],
                  "Section 2":["Item 3", "Item 4"]]
    var body: some View {
        let sections = Array(datas.keys).sorted()
        List(sections.indices, id:\.self) { index in
            let key = sections[index]
            if let items = datas[key] {
                Section(header: Text(key)) {
                    ForEach(items, id: \.self ) { item in
                        Text(item)
                    }
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct SwiftUIListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListView()
    }
}
