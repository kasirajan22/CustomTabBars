//
//  TabBar2.swift
//  CustomTabBars
//
//  Created by Magizhan on 22/10/20.
//

import SwiftUI

struct TabBar2: View {
  
    var body: some View {
        NavigationView {
            TabBar2Home()
                .navigationTitle("Tab View 2")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TabBar2Home: View {
    @State private var index: Int = 0
    var body: some View{
        VStack{
            TabView(selection: $index) {
                Color.red
                    .tag(0)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    
                
                Color.blue
                    .tag(1)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                    }
                
                Color.pink
                    .tag(2)
                    .tabItem {
                        Image(systemName: "gear")
                    }
                
                Color.green
                    .tag(3)
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarItems(trailing: Menu(content: {
                Button(action: {
                    withAnimation(){
                        index = 0
                    }
                }, label: {
                    HStack{
                        Text("Home")
                        Spacer()
                        Image(systemName: "house.fill")
                    }
                })
                Button(action: {
                    withAnimation(){
                        index = 1
                    }
                }, label: {
                    HStack{
                        Text("Favorite")
                        Spacer()
                        Image(systemName: "suit.heart.fill")
                    }
                })
                Button(action: {
                    withAnimation(){
                        index = 2
                    }
                }, label: {
                    HStack{
                        Text("Settings")
                        Spacer()
                        Image(systemName: "gear")
                    }
                })
                Button(action: {
                    withAnimation(){
                        index = 3
                    }
                }, label: {
                    HStack{
                        Text("Accounts")
                        Spacer()
                        Image(systemName: "person.fill")
                    }
                })
            }, label: {
                Image(systemName: "line.horizontal.3")
            }))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBar2_Previews: PreviewProvider {
    static var previews: some View {
        TabBar2()
    }
}
