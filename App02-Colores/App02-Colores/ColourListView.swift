//
//  ContentView.swift
//  App02-Colores
//
//  Created by David Cantú Delgado on 27/10/21.
//

import SwiftUI

struct ColourListView: View {
    
    @StateObject var colourModel = ColourModel()
    @State var search: String = ""
    
    var body: some View {
        NavigationView {
        VStack {
            TextField("Búsqueda", text: $search)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title)
                .padding(.top, 10)
                .padding(.horizontal,20)
            List {
                Section(header:
                    Text("FlatUI Pallete")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        , content: {
                    ForEach(colourModel.flatUI.filter {
                        search.isEmpty || $0.name.localizedStandardContains(search)
                    }) { colour in
                        NavigationLink(destination: ColourDetailView(colour: colour)) {
                            Text(colour.name)
                                .font(.title)
                                .foregroundColor(colour.dark ? .white : .black)
                        }
                        .listRowBackground(colour.colour)
                    }
                })
                Section(header:
                    Text("Spanish Pallete")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        , content: {
                    ForEach(colourModel.spanish.filter {
                        search.isEmpty || $0.name.localizedStandardContains(search)
                    }) { colour in
                        NavigationLink(destination: ColourDetailView(colour: colour)) {
                            Text(colour.name)
                                .font(.title)
                                .foregroundColor(colour.dark ? .white : .black)
                        }
                        .listRowBackground(colour.colour)
                    }
                })
                Section(header:
                    Text("American Pallete")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        , content: {
                    ForEach(colourModel.american.filter {
                        search.isEmpty || $0.name.localizedStandardContains(search)
                    }) { colour in
                        NavigationLink(destination: ColourDetailView(colour: colour)) {
                            Text(colour.name)
                                .font(.title)
                                .foregroundColor(colour.dark ? .white : .black)
                        }
                        .listRowBackground(colour.colour)
                    }
                })

            }
            .listStyle(SidebarListStyle())
            .accentColor(.gray)
        }
        .navigationBarTitle("Lista")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(.black, UIColor(Colour.Clouds.colour))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Lista")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Colour.Clouds.colour)
            }
        }
        }
    }
}

struct ColourListView_Previews: PreviewProvider {
    static var previews: some View {
        ColourListView()
    }
}
