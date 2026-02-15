//
//  SearchBarView.swift
//  Reddit
//
//  Created by Ayush Kumar Singh on 15/02/26.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    @Binding var searchBarText: String
    
    func makeUIView(context: Context) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        return searchBar
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
        uiView.text = searchBarText
    }
    
    typealias UIViewType = UISearchBar
}

#Preview {
    SearchBarView(searchBarText: .constant("Test"))
}
