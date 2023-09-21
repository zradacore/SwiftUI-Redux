//
//  DetailPostScreen.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import SwiftUI

struct DetailPostScreen: View {
    @State var error : Bool = false
    @State var detailPostId : Int? = nil
    @EnvironmentObject var store : AppStore
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                Text(store.state.detailPost.detailPost.title ?? "").font(.largeTitle).foregroundColor(.black).padding()
                Text(store.state.detailPost.detailPost.body ?? "").foregroundColor(.black).font(.body).padding()
                
            }
                .alert(store.state.detailPost.fetchingError ?? "Something went wrong", isPresented: $error) {
                           Button("Back", role: .cancel) { }
                       }
                .overlay {
                    if store.state.detailPost.isFetching{
                        ProgressView()
                    }
                    
                }
        }.onAppear{
            store.dispatch(.detailPost(action: .fetch(id: detailPostId)))
        }
    }
}

struct DetailPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailPostScreen()
    }
}
