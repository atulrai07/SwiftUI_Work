//
//  ContentView.swift
//  Landmarks
//
//  Created by Atul on 15/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var landmarks = DataModel.landmarks
    @State private var selectedIndex = 0
    @State private var showFullAbout : Bool = false
    
    var body: some View {
        let landmark = landmarks[selectedIndex]
        
        ZStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Spacer(minLength: 300)
                        VStack{
                            HStack {
                                Text(landmark.name)
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .bold()
                                
                                Spacer()
                                
                                Button {
                                    landmarks[selectedIndex].isFavorited.toggle()
                                } label: {
                                    Image(systemName: landmark.isFavorited ? "heart.fill" : "heart")
                                        .imageScale(.large)
                                        .foregroundColor(.blue)
                                        .font(.title2)
                                }
                                .padding()
                                .background(.white)
                                .clipShape(Circle())
                                .shadow(color: .black,radius: 20)
                            }
                            .padding(.horizontal)
                            
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.white)
                            VStack{
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("About")
                                        .font(.title.bold())
                                        .padding(.vertical)
                                    
                                    Text(showFullAbout ? landmark.about : String(landmark.about.prefix(150)) + "...")
                                        .font(.body)
                                    
                                    Button(showFullAbout ? "Read less" : "Read more") {
                                        showFullAbout.toggle()
                                    }
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.bottom)
                                }
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Amenities")
                                        .font(.headline)
                                    
                                    ScrollView(.horizontal,showsIndicators: false) {
                                        HStack {
                                            ForEach(landmark.amenities) { amenity in
                                                HStack {
                                                    Image(systemName: amenity.imageName)
                                                    Text(amenity.name.rawValue)
                                                        .font(.caption)
                                                }
                                                .padding()
                                                .background(Color.yellow)
                                                .cornerRadius(25)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Discover other landmarks")
                                        .font(.headline)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(landmarks.indices, id: \.self) { index in
                                                Button {
                                                    selectedIndex = index
                                                    showFullAbout = false
                                                } label: {
                                                    VStack {
                                                        Image(landmarks[index].imageName)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 180, height: 120)
                                                            .clipped()
                                                            .cornerRadius(10)
                                                        Text(landmarks[index].name)
                                                            .foregroundStyle(.black)
                                                            .padding(.bottom,10)
                                                    }
                                                    .shadow(color:.black,radius: 5)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                }
            }
            .background(Image(landmark.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 603)
                .offset(y:-150))
        }
    }
}

#Preview {
    ContentView()
}

