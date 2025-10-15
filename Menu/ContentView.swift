//
//  ContentView.swift
//  Menu
//
//  Created by Rani Shah on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var menuItems:[MenuItem] = [MenuItem]()
    var dataService = DataService()
    
    
    
    var body: some View {
        List(menuItems)
        { item in
            HStack
            {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .cornerRadius(10)
                
                Text(item.name)
                    .bold()
                Spacer()
                Text("$" + item.price)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(
                Color(.brown)
                    .opacity(0.1))
            
        }
        .listStyle(.plain)
        .onAppear()
        {
            // call for the data
            menuItems = dataService.getData()
        }
    }
}

#Preview {
    ContentView()
}
