//
//  ContentView.swift
//  MockAppStore
//
//  Created by Atul on 20/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing:240){
                    Text("Apps")
                        .font(Font.largeTitle)
                        .bold(true)
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 40))
                }
                
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 100, height: 30)
                            .clipShape(Capsule())
                        Label("All", systemImage: "arrow.2.circlepath.circle")
                    }
                    ZStack{
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 100, height: 30)
                            .clipShape(Capsule())
                        Label("All", systemImage: "arrow.2.circlepath.circle")
                    }
                    ZStack{
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 100, height: 30)
                            .clipShape(Capsule())
                        Label("All", systemImage: "arrow.2.circlepath.circle")
                    }
                }
                Text("Exclusive apps")
                    .font(Font.caption)
                    .foregroundStyle(.tint)
                Text("Announcement Title which can be very long")
                    .font(Font.title)
                Image("AppBanner")
                    .resizable()
                    .frame(height:250)
                    .cornerRadius(20)
                HStack{
                    Text("Top Apps This Week")
                        .font(Font.title)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.tint)
                }
                HStack(spacing:20){
                    Image("AppLogo")
                        .resizable()
                        .frame(width:50, height:50)
                    VStack(alignment:.leading){
                        Text("App Name")
                        Text("Description text goes here")
                            .font(.caption)
                    }
                    Button("get"){}
                        .frame(width:30, height:10)
                        .padding()
                        .background(.tint)
                        .foregroundStyle(Color.white)
                        .clipShape(Capsule())
                        .offset(x:60)
                }
                HStack{
                    Text("Browswse Categories")
                        .font(Font.title)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.tint)
                    
                }
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(1..<4) { i in
                            ZStack(alignment:.bottomLeading){
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: 200, height: 120)
                                    .cornerRadius(20)
                                Text("Category \(i)")
                                    .foregroundStyle(.white)
                                    .padding()
                                Image(systemName: "square.fill")
                                    .offset(x:160,y:-80)
                                    .font(.system(size: 30))
                            }
                        }
                    }
                }
                Text("Quick Links")
                    .font(Font.title)
                ForEach(1..<6) {i in
                    Text("Link \(i)")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
