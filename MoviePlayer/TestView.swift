//
//  TestView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct TestView: View {
    @StateObject var fetcher = MovieFetcher()
    
    var body: some View {
        List {
         Text("fetching playlists with movie trailes")
            
            ForEach(fetcher.playlists) { playlist in
                Text(playlist.snippet.title)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
