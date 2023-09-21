//
//  ContentView.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import SwiftUI

struct PostsListScreen: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Posts")
                        .font(.largeTitle.bold())
                    
                    
                    Spacer()
                    
                }
                .padding()
               
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ForEach(self.store.state.posts.posts, id:\.self) { post in
                            NavigationLink {
                                DetailPostScreen(detailPostId: post.id)
                            } label: {
                                ZStack(alignment: .bottom) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(post.title ?? "")
                                            .font(.system(size: 14))
                                            .foregroundColor(.userNameColor)
                                        HStack {
                                            Text(post.body ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12))
                                            Spacer()
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width / 1.4)
                                    .padding()
                                    .padding(.bottom, 10)
                                    .background(Color.white)
                                    .cornerRadius(25)
                                    
                                }
                            }

                            
                        }
                    }
                    
                }
                
            }
            .background(Color.backgroundColor)
            .padding(.bottom, 20)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                //TODO: dispatch fetching Post
                self.store.dispatch(.post(action: .fetch))
            }
            .overlay {
                if self.store.state.posts.isFetching{
                    ProgressView()
                }
            }
        }
        
        
        
    }
}



struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListScreen()
    }
}
