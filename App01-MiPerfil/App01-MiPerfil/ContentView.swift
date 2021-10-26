//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showEditView: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    ZStack {
                        Color("ColorArriba")
                        VStack {
                            Text("David Cantú")
//                                .font(.custom("RobotoSlab-Medium", size: 44))
//                                .modifier(TextModifier())
                                .font(.Roboto(size: 42, weight: "Black"))
                                .foregroundColor(Color("Texto"))
                        }
                    }
                }
                VStack {
                    ZStack {
                        Color("ColorAbajo")
                        VStack {
                            HStack {
                                Text("Matricula:")
                                Text("A00189239")
                            }
                            HStack {
                                Text("Fecha nacimiento:")
                                Text("1968/07/19")
                            }
                            HStack {
                                Text("Peso:")
                                Text("88")
                                Text("-")
                                Text("Altura:")
                                Text("1.80")
                            }
                            
                            Button(action: {
                                showEditView = true
                            }, label: {
                                HStack {
                                    Image(systemName: "pencil.circle.fill")
                                        .font(.largeTitle)
                                    Text("Editar")
                                }
                                .padding()
                                .background(Color("ColorArriba"))
                                .cornerRadius(20)
                            })
                                .padding(.top, 20)
                        }
                        .font(.Roboto(size: 28, weight: "Regular"))
                        .foregroundColor(Color("Texto"))

                    }
                }
            }
            VStack {
                Image("imagen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color("Texto"), style: StrokeStyle(lineWidth: 10))
                    )
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showEditView) {
            EditView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
