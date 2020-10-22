//
//  TabBar1.swift
//  CustomTabBars
//
//  Created by Magizhan on 21/10/20.
//

import SwiftUI

var tabItems = ["Home","Search","Settings"]

struct TabBar1: View {
    @State var selected = "Home"
    init() {
        UITabBar.appearance().isHidden = true
    }
    @Environment(\.verticalSizeClass) var size
    @State var centerX : CGFloat = 0
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selected,
                    content:  {
                        Color.red
                            .tag(tabItems[0])
                            .ignoresSafeArea(.all)
                        
                        Color.blue
                            .tag(tabItems[1])
                            .ignoresSafeArea(.all)
                        
                        Color.green
                            .tag(tabItems[2])
                            .ignoresSafeArea(.all)
                    })
            
            HStack(spacing: 0){
                ForEach(tabItems,id: \.self) { item in
                    GeometryReader{reader in
                        TabBarButton(Selected: $selected, value: item, centerX: $centerX, rect: reader.frame(in: .global))
                            .onAppear(perform: {
                                if item == tabItems.first {
                                    centerX = reader.frame(in: .global).midX
                                    
                                }
                            })
                            .onChange(of: size, perform: { value in
                                if item == selected {
                                    centerX = reader.frame(in: .global).midX
                                }
                            })
//                            .onChange(of: size) { (_) in
//                                print("changed");
//                                if selected == item{
//                                    centerX = reader.frame(in: .global).midX
//                                    print(reader.size.width)
//                                }
//                            }
                    }
                    .frame(width:70,height: 50)
                    if item != tabItems.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal, 25)
            .padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(AnimatedShape(centerX: centerX )))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            .padding(.top, -15)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarButton: View {
    @Binding var Selected: String
    var value: String
    @Binding var centerX : CGFloat
    var rect: CGRect
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                Selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack(spacing: 10){
                Image(systemName: "homekit")
                    .font(.title2)
                    //.resizable()
                    //.renderingMode(.original)
                    .frame(width:25,height: 25)
                    .foregroundColor(Selected == value ? Color.yellow : Color.gray)
                
                Text(value)
                    .font(.caption)
                    .foregroundColor(.black)
                    .opacity(Selected == value ? 1 : 0)
                
            }
            .padding(.top)
            .frame(width:70, height: 50)
            .offset(y: Selected == value ? -15 : 0)
        })
    }
}

struct AnimatedShape: Shape {
    var centerX: CGFloat
    var animatableData: CGFloat {
        get {return centerX}
        set {centerX = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 15))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 15))
            
            //Curve
            
            path.move(to: CGPoint(x: centerX - 35, y: 15))
                          path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
        }
    }
}

struct TabBar1_Previews: PreviewProvider {
    static var previews: some View {
        TabBar1()
            .previewDevice("iPhone SE (2nd generation)")
        
        
    }
}
