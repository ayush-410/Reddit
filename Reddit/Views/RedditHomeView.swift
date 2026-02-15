//
//  ContentView.swift
//  Reddit
//
//  Created by Ayush Kumar Singh on 21/01/26.
//

import SwiftUI

struct RedditHomeView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var selectedPost: Post?
    @State private var subreddit: String = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    List(viewModel.posts, id: \.id) { post in
                        VStack(alignment: .leading){
                            Text(post.title)
                                .font(.headline)
                            Text(post.subreddit)
                                .font(.subheadline)
                                .foregroundStyle(Color(.secondaryLabel))
                        }.onTapGesture {
                            selectedPost = post
                            print(post.url as Any)
                        }
                    }
                }
            }
            .navigationTitle("reddit")
        }
        .searchable(text: $subreddit, placement: .navigationBarDrawer(displayMode: .always), prompt: "Enter subreddit")
        .onSubmit(of: .search, {
            viewModel.fetchPostsBySubreddit(subreddit: subreddit)
        })
        .fullScreenCover(item: $selectedPost) { post in
            if let urlString = post.url, let url = URL(string: urlString) {
                //RedditWebView(webViewURL: url)
                SafariView(url: url)
            } else {
                Text("Invalid Url")
            }
        }
    }
}

#Preview {
    RedditHomeView()
}
