//
//  DetailCovid.swift
//  Covid 19
//
//  Created by Yazid Al Ghazali on 12/11/20.
//  Copyright © 2020 Yazid Al Ghazali. All rights reserved.
//

import SwiftUI
import SwiftWebImage

struct DetailCovid: View {
    @ObservedObject var api = ApiCovid()
    var covid: Country
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                ZStack{
                    Color(.white).cornerRadius(5).frame(width: 300,height: 180).shadow(radius: 5).padding(5)
                    VStack{
                    SwiftImage("https://www.countryflags.io/\(covid.countryCode)/flat/64.png"){
                        image in image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                    .frame(width: 200, height: 150)
                    .shadow(radius: 5)
                    Text(covid.country)
                        .font(.body)
                        .bold()
                        .padding(.bottom, 19)
                    }
                }
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("Total Confirmed")
                                Text(String(covid.totalConfirmed)).foregroundColor(Color.green)
                            }
                        }
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("Total Recovered")
                                Text(String(covid.totalRecovered)).foregroundColor(Color.blue)
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("Total Deaths")
                                Text(String(covid.totalDeaths)).foregroundColor(Color.red)
                            }
                        }
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("New Confirmed")
                                Text(String(covid.newConfirmed)).foregroundColor(Color.green)
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("New Recovered")
                                Text(String(covid.newRecovered)).foregroundColor(Color.blue)
                            }
                        }
                        Spacer()
                        ZStack{
                            Color(.white).cornerRadius(5).frame(width: 140,height: 100).shadow(radius: 5).padding(5)
                            VStack{
                                Text("new Deaths")
                                Text(String(covid.newDeaths)).foregroundColor(Color.red)
                            }
                        }
                        Spacer()
                    }
                }
            }
                
            .onAppear{
                self.api.getData()
            }
        }
    }
}
