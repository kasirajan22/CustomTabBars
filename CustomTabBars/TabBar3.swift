//
//  TabBar3.swift
//  CustomTabBars
//
//  Created by Magizhan on 22/10/20.
//

import SwiftUI

struct TabBar3: View {
    @State var index: Int = 0
    var body: some View {
        NavigationView{
        ZStack{
            containedView()
            
            VStack {
                Spacer()
                TabBar3Bar(index: $index)
            }
        }
        .animation(.spring())
        }
    }
    func containedView() -> AnyView {
         switch index {
         case 0:
             return AnyView(Color.red.edgesIgnoringSafeArea(.top))

         case 1:
             return AnyView(Color.blue.edgesIgnoringSafeArea(.top))

         case 2:
             return AnyView(Color.green.edgesIgnoringSafeArea(.top))

         default:
             return AnyView(Color.yellow.edgesIgnoringSafeArea(.top))
         }
         
      }
}



struct TabBar3_Previews: PreviewProvider {
    static var previews: some View {
        TabBar3()
    }
}

struct TabBar3Bar: View {
    @Binding var index: Int
    var body: some View{
        HStack(spacing: 15, content: {
            HStack{
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(self.index == 0 ? "Home" : "")
                    .fontWeight(.light)
                    .font(.system(size: 14))
            }
            .padding(15)
            .background(self.index == 0 ? Color.red.opacity(0.5) :  Color.clear)
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                self.index = 0
            })
            
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(self.index == 1 ? "Accounts" : "")
                    .fontWeight(.light)
                    .font(.system(size: 14))
            }
            .padding(15)
            .background(self.index == 1 ? Color.blue.opacity(0.5) :  Color.clear)
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                self.index = 1
            })
            
            HStack{
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(self.index == 2 ? "Notification" : "")
                    .fontWeight(.light)
                    .font(.system(size: 14))
            }
            .padding(15)
            .background(self.index == 2 ? Color.green.opacity(0.5) :  Color.clear)
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                self.index = 2
            })
            
            HStack{
                Image(systemName: "tv.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(self.index == 3 ? "Watch" : "")
                    .fontWeight(.light)
                    .font(.system(size: 14))
            }
            .padding(15)
            .background(self.index == 3 ? Color.yellow.opacity(0.5) :  Color.clear)
            .clipShape(Capsule())
            .onTapGesture(count: 1, perform: {
                self.index = 3
            })
        })
        .padding(.top, 15)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.white)
        .animation(.default)
    }
}
