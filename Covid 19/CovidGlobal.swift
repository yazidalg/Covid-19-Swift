//
//  CovidGlobal.swift
//  Covid 19
//
//  Created by Yazid Al Ghazali on 12/11/20.
//  Copyright © 2020 Yazid Al Ghazali. All rights reserved.
//

import SwiftUI
import SwiftWebImage

struct CovidGlobal: View {
    @ObservedObject var api = ApiCovid()
    @State var search = ""
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search...", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 40)
                    .foregroundColor(Color.black)
                    .shadow(radius: 5)
                    .padding()
                HStack{
                    Spacer()
                    Text("Confirmed").foregroundColor(Color.green)
                    Spacer()
                    Text("Recovered").foregroundColor(Color.blue)
                    Spacer()
                    Text("Deaths").foregroundColor(Color.red)
                    Spacer()
                }
                List(api.apiCov.filter({
                    search.isEmpty ? true : $0.country.contains(search)
                })){data in
                    NavigationLink(destination: DetailCovid(covid: data)){
                        VStack{
                            HStack{
                                SwiftImage("https://www.countryflags.io/\(data.countryCode)/flat/64.png"){
                                    image in image
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                    
                                }
                                .frame(width: 40, height: 35)
                                .shadow(radius: 6)
                                Text(data.country)
                                    .font(.body).bold()
                                    .padding(.bottom, 15)
                                    .padding(.top, 10)
                                
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text(String(data.totalConfirmed))
                                    .foregroundColor(Color.green)
                                Spacer()
                                Text(String(data.totalRecovered))
                                    .foregroundColor(Color.blue)
                                Spacer()
                                Text(String(data.totalDeaths))
                                    .foregroundColor(Color.red)
                                Spacer()
                            }
                        }
                    }
                }
                .onAppear{
                    self.api.getData()
                }
            }.navigationBarTitle("Covid 19", displayMode: .inline)
        }
        
    }
}
