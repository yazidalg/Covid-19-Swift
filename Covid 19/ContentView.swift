//
//  ContentView.swift
//  Covid 19
//
//  Created by Yazid Al Ghazali on 12/11/20.
//  Copyright © 2020 Yazid Al Ghazali. All rights reserved.
//

import SwiftUI
import SwiftWebImage

struct ContentView: View {
    @ObservedObject var api = ApiCovid()
    @State var selected = 0
    var body: some View {
        TabView{
            CovidGlobal()
                .tabItem{
                    Text("Global")
            }.tag(1)
            CovidLocal()
                .tabItem{
                    Text("Local")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
