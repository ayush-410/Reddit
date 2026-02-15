//
//  ViewModel.swift
//  Reddit
//
//  Created by Ayush Kumar Singh on 21/01/26.
//

import Foundation
import Combine
import SwiftUI

final class ViewModel: ObservableObject {
    
    let service = NetworkService()
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    
    init() {
        fetchPage()
    }
    
    func fetchPage(){
        
        isLoading = true
        service.execute(endpoint: .home) { result in
            switch result {
            case .success(let page):
                DispatchQueue.main.async {
                    self.posts = page.posts
                    self.isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchPostsBySubreddit(subreddit:String){
        
        isLoading = true
        service.execute(endpoint: .subreddit(named: subreddit)) { result in
            switch result {
            case .success(let page):
                DispatchQueue.main.async{
                    self.posts=page.posts
                    self.isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
