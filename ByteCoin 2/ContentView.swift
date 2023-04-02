//
//  ContentView.swift
//  ByteCoin 2
//
//  Created by Rajat Nagvenker on 8/31/21.
//

import SwiftUI

struct ContentView: View, CoinManagerDelegate {
    func didFetchData(coinData: CoinData) {
        rate = coinData.rate
        currency = coinData.currency
    }
    @State var rate: Double = 0.0
    @State var currency: String = "USD"
    var coinManager = CoinManager()
    var body: some View {
        ZStack {
            Color("Background Color")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Text("ByteCoin")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.bottom, 50)
                
                HStack{
                    
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(String(format: "%.2f", rate)) \(currency)")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                } .padding(.vertical)
                .padding(.horizontal)
                .background(Color.black.opacity(0.15).cornerRadius(25))
                .padding(.horizontal)
                
                Spacer()
                
                                Picker("Currency", selection: $currency, content: {
                                    ForEach(coinManager.currencyArray, id: \.self) {
                                        Text($0)
                                    }
                                })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
